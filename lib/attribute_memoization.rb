# frozen_string_literal: true

require_relative "attribute_memoization/version"

module AttributeMemoization
  def attr_accessor(*names, &block)
    return super(*names) unless block_given?

    attr_reader(*names, &block)
    attr_writer(*names)
  end

  def attr_reader(*names, &block)
    return super(*names) unless block_given?

    names.each do |name|
      instance_variable = :"@#{name}"

      self.define_method(name) do
        if self.instance_variable_defined?(instance_variable)
          return self.instance_variable_get(instance_variable)
        else
          self.instance_variable_set(instance_variable, self.instance_exec(&block))
        end
      end
    end
  end
end

Module.prepend(AttributeMemoization)
