class SignUpsController < ApplicationController
  before_action :current_user_must_be_sign_up_kwestee, :only => [:edit, :update, :destroy]

  def current_user_must_be_sign_up_kwestee
    sign_up = SignUp.find(params[:id])

    unless current_user == sign_up.kwestee
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = SignUp.ransack(params[:q])
    @sign_ups = @q.result(:distinct => true).includes(:kwestee, :trip).page(params[:page]).per(10)

    render("sign_ups/index.html.erb")
  end

  def show
    @sign_up = SignUp.find(params[:id])

    render("sign_ups/show.html.erb")
  end

  def new
    @sign_up = SignUp.new

    render("sign_ups/new.html.erb")
  end

  def create
    @sign_up = SignUp.new

    @sign_up.kwestee_id = params[:kwestee_id]
    @sign_up.trip_id = params[:trip_id]

    save_status = @sign_up.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sign_ups/new", "/create_sign_up"
        redirect_to("/sign_ups")
      else
        redirect_back(:fallback_location => "/", :notice => "Sign up created successfully.")
      end
    else
      render("sign_ups/new.html.erb")
    end
  end

  def edit
    @sign_up = SignUp.find(params[:id])

    render("sign_ups/edit.html.erb")
  end

  def update
    @sign_up = SignUp.find(params[:id])
    @sign_up.trip_id = params[:trip_id]

    save_status = @sign_up.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sign_ups/#{@sign_up.id}/edit", "/update_sign_up"
        redirect_to("/sign_ups/#{@sign_up.id}", :notice => "Sign up updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Sign up updated successfully.")
      end
    else
      render("sign_ups/edit.html.erb")
    end
  end

  def destroy
    @sign_up = SignUp.find(params[:id])

    @sign_up.destroy

    if URI(request.referer).path == "/sign_ups/#{@sign_up.id}"
      redirect_to("/", :notice => "Sign up deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Sign up deleted.")
    end
  end
end
