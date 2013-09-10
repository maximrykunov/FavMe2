# REFACTOR
module App
  module DocumentItem
    class Base
      def self.assign(base, controller, name, &block)
        fail "Document base param must be a Workflow." unless base.is_a?(Workflow)

        klass = base.class.name
        method_name = name.present? ? name : klass.underscore

        if controller.respond_to?(method_name)
          Rails.logger.warn <<-WARNING
            Warning: method '#{ method_name }' already assigned to the document.
          WARNING
        end

        res = block.call(new(base))

        controller.view_context.class.send :define_method, method_name do
          presenter = "#{ klass }Presenter".constantize
          presenter.new(controller, res.fetch != Nothing ? res : Either(base))
        end

        res
      end

      def initialize(base)
        @base = base
        @result = Success.new(Nothing.new)
      end

      # Runs if there was Nothing.
      def may(method = nil, &block)
        return @result unless @result == Success.new(Nothing)

        new_base = @base.class.unit(@base.fetch)
        @result = MayDispatcher.get(method, new_base)
        if block_given? && @result.success? && @result.fetch != Nothing
          @result = block.call(self.class.new(new_base))
        end

        @result
      end

      # Runs if there was no Failure.
      def must(method = nil, &block)
        return @result if @result.failure?

        @result = MustDispatcher.get(method, @base)
        @base = @result.fetch
        if block_given? && @result.success?
          @result = block.call(self.class.new(@base))
        end

        @result = Success.new(Nothing)
      end

      def or_fail(method = nil)
        return @result unless @result == Success.new(Nothing)

        @result = FailDispatcher.get(method, @base)
        @base = @result.fetch

        @result
      end
    end

    module Dispatcher
      extend self

      def get(method, base)
        @method = method
        @base = base
        method.nil? ? Either(base) : dispatch
      end

    protected

      def dispatch
        res = if @method.is_a?(Proc)
          @method.arity == 0 ? @method.call : @method.call(@base)
        elsif @method.is_a?(Symbol)
          @base.send(@method)
        else
          fail "Document method argument: only Proc and Symbol types are supported."
        end
        unit(res)
      end
    end

    class MayDispatcher
      extend Dispatcher

    protected

      def self.unit(res)
        if !res
          Success.new(Nothing.new)
        elsif res == true
          Either(@base)
        elsif res.is_a?(Failure)
          @base.add_failure(res.fetch)
          Failure.new(@base)
        else
          Either(@base.class.unit(res))
        end
      end
    end

    module MustDispatcher
      extend Dispatcher

    protected

      def self.unit(res)
        if !res || res.is_a?(Failure)
          @base.add_failure(Failure(res).fetch)
          Failure.new(@base)
        elsif res == true
          Either(@base)
        else
          Either(@base.class.unit(res))
        end
      end
    end

    module FailDispatcher
      extend Dispatcher

    protected

      def self.unit(res)
        @base.add_failure(Failure(res).fetch)
        Failure.new(@base)
      end
    end
  end
end
