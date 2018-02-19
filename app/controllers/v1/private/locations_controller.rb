class V1::Private::LocationsController < V1::Private::BaseController

  def index
    locations = LocationsForCountryQuery.new(params[:country_code]).fetch

    render json: locations
  end

end
