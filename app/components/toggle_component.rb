# frozen_string_literal: true

class ToggleComponent < ViewComponent::Base
  def initialize(f:, field:, checked_value:, unchecked_value:, **options)
    @f = f
    @field = field
    @checked_value = checked_value
    @unchecked_value = unchecked_value
    @options = options
  end
end
