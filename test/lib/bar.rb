# frozen_string_literal: true
class Bar
  def initialize(param)
    @param = param
  end

  def get_param
    @param
  end

  def miscellaneous_method
    # :nocov:
    raise "Don't call me!"
    # :nocov:
  end
end
