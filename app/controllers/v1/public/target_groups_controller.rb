class V1::Public::TargetGroupsController < V1::Public::BaseController

  def index
    target_groups = TargetGroupsForCountryQuery.new(params[:country_code]).fetch

    render json: target_groups
  end
end
