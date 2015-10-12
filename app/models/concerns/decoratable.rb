module Decoratable
  extend ActiveSupport::Concern

  def decorate
    decorator_class.new(self)
  end

  private

  def decorator_class
    "#{self.class.name}Decorator".constantize
  end
end
