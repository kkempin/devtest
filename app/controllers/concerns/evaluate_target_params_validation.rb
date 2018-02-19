module EvaluateTargetParamsValidation
  extend ActiveSupport::Concern

  def validate_params
    param! :target_group_id, Integer, min: 1, required: true
    param! :country_code, String, blank: false, required: true
    param! :locations, Array, required: true do |b, index|
      b.param! :id, Integer, required: true
      b.param! :panel_size, Integer, required: true
    end
  end
end
