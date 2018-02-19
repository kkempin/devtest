class V1::Private::EvaluateTargetController < V1::Private::BaseController
  include EvaluateTargetParamsValidation

  before_action :validate_params

  def create
    evaluation_service = EvaluationService.new(
      params[:country_code],
      params[:target_group_id],
      params[:locations]
    )

    render json: evaluation_service.calculate
  end
end
