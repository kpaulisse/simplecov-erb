# frozen_string_literal: true
class Foo
  def initialize(param)
    @param = param
  end

  def set_param(value)
    @param = value
  end

  def get_param
    @param
  end

  def format_param
    "Your parameter is : #{get_param}"
  end

  def miscellaneous_method
    # :nocov:
    raise "Don't call me!"
    # :nocov:
  end
end
