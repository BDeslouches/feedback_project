class KwestTripsController < ApplicationController
  def index
    @kwest_trips = KwestTrip.all

    render("kwest_trips/index.html.erb")
  end

  def show
    @sign_up = SignUp.new
    @review = Review.new
    @kwest_trip = KwestTrip.find(params[:id])

    render("kwest_trips/show.html.erb")
  end

  def new
    @kwest_trip = KwestTrip.new

    render("kwest_trips/new.html.erb")
  end

  def create
    @kwest_trip = KwestTrip.new

    @kwest_trip.name = params[:name]
    @kwest_trip.start_date = params[:start_date]
    @kwest_trip.end_date = params[:end_date]
    @kwest_trip.enrollment_id = params[:enrollment_id]

    save_status = @kwest_trip.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/kwest_trips/new", "/create_kwest_trip"
        redirect_to("/kwest_trips")
      else
        redirect_back(:fallback_location => "/", :notice => "Kwest trip created successfully.")
      end
    else
      render("kwest_trips/new.html.erb")
    end
  end

  def edit
    @kwest_trip = KwestTrip.find(params[:id])

    render("kwest_trips/edit.html.erb")
  end

  def update
    @kwest_trip = KwestTrip.find(params[:id])

    @kwest_trip.name = params[:name]
    @kwest_trip.start_date = params[:start_date]
    @kwest_trip.end_date = params[:end_date]
    @kwest_trip.enrollment_id = params[:enrollment_id]

    save_status = @kwest_trip.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/kwest_trips/#{@kwest_trip.id}/edit", "/update_kwest_trip"
        redirect_to("/kwest_trips/#{@kwest_trip.id}", :notice => "Kwest trip updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Kwest trip updated successfully.")
      end
    else
      render("kwest_trips/edit.html.erb")
    end
  end

  def destroy
    @kwest_trip = KwestTrip.find(params[:id])

    @kwest_trip.destroy

    if URI(request.referer).path == "/kwest_trips/#{@kwest_trip.id}"
      redirect_to("/", :notice => "Kwest trip deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Kwest trip deleted.")
    end
  end
end
