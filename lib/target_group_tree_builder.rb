class TargetGroupTreeBuilder

  def initialize(panel_providers)
    @panel_providers = panel_providers
  end

  def run(parent, level=0)
    return if level > 3

    1.upto(number_of_children_to_generate) do |index|
      create_branch(parent, index, level)
    end
  end

  private

  def number_of_children_to_generate
    (1..3).to_a.sample
  end

  def create_branch(parent, index, level)
    target_group = create_target_group(parent, index)

    run(target_group, level+1)
  end

  def create_target_group(parent, index)
    target_group_name = "#{parent.name} - #{index}"
    target_group = TargetGroup.create(
      name: target_group_name,
      external_id: Digest::MD5.hexdigest(target_group_name),
      secret_code: Digest::SHA256.hexdigest(target_group_name),
      parent_id: parent.id,
      panel_provider: @panel_providers[index - 1]
    )
  end
end
