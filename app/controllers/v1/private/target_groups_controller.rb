class V1::Private::TargetGroupsController < V1::Private::BaseController

  def index
    target_groups = TargetGroupsForCountryQuery.new(params[:country_code]).fetch

    render json: target_groups
  end
end
