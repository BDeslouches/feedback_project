class RecommendationsController < ApplicationController
  before_action :current_user_must_be_recommendation_sender, :only => [:edit, :update, :destroy]

  def current_user_must_be_recommendation_sender
    recommendation = Recommendation.find(params[:id])

    unless current_user == recommendation.sender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Recommendation.ransack(params[:q])
    @recommendations = @q.result(:distinct => true).includes(:sender, :trip).page(params[:page]).per(10)

    render("recommendations/index.html.erb")
  end

  def show
    @recommendation = Recommendation.find(params[:id])

    render("recommendations/show.html.erb")
  end

  def new
    @recommendation = Recommendation.new

    render("recommendations/new.html.erb")
  end

  def create
    @recommendation = Recommendation.new

    @recommendation.sender_id = params[:sender_id]
    @recommendation.recipient_id = params[:recipient_id]
    @recommendation.body = params[:body]
    @recommendation.rec_type = params[:rec_type]

    save_status = @recommendation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recommendations/new", "/create_recommendation"
        redirect_to("/recommendations")
      else
        redirect_back(:fallback_location => "/", :notice => "Recommendation created successfully.")
      end
    else
      render("recommendations/new.html.erb")
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])

    render("recommendations/edit.html.erb")
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    @recommendation.recipient_id = params[:recipient_id]
    @recommendation.body = params[:body]
    @recommendation.rec_type = params[:rec_type]

    save_status = @recommendation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recommendations/#{@recommendation.id}/edit", "/update_recommendation"
        redirect_to("/recommendations/#{@recommendation.id}", :notice => "Recommendation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Recommendation updated successfully.")
      end
    else
      render("recommendations/edit.html.erb")
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])

    @recommendation.destroy

    if URI(request.referer).path == "/recommendations/#{@recommendation.id}"
      redirect_to("/", :notice => "Recommendation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Recommendation deleted.")
    end
  end
end
