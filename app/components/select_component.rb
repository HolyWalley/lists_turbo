# frozen_string_literal: true

class SelectComponent < ViewComponent::Base
  def initialize(f:, label:, field:, list:, options:, **html_options)
    @f = f
    @label = label
    @field = field
    @list = list
    @options = options
    @html_options = html_options
  end
end
