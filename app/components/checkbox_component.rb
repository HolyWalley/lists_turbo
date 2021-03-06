# frozen_string_literal: true

class CheckboxComponent < ViewComponent::Base
  def initialize(f:, field:, checked_value: 1, unchecked_value: 0, **options)
    @f = f
    @field = field
    @checked_value = checked_value
    @unchecked_value = unchecked_value
    @options = options
  end
end
