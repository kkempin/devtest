class V1::Public::LocationsController < V1::Public::BaseController

  def index
    locations = LocationsForCountryQuery.new(params[:country_code]).fetch

    render json: locations
  end
end
