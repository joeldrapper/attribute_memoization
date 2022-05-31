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
      private define_method("_calculate_#{name}", &block)

      class_eval(<<-RUBY, __FILE__, __LINE__ + 1)
        def #{name}
          return @#{name} if defined? @#{name}
          @#{name} = _calculate_#{name}
        end
      RUBY
    end
  end
end

Module.prepend(AttributeMemoization)
