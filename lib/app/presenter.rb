module App
  class Presenter
    include Rails.application.routes.url_helpers
    include AbstractController::Helpers
    include ActionView::Helpers

    attr_reader :request
    attr_reader :proc

    def initialize(template, proc = nil)
      @template = template
      @request = template.request
      @proc = proc
    end

    def template
      @template
    end
    alias :h :template

    def fetch
      @proc.fetch
    end
    alias :f :fetch

    def value
      @proc.fetch.fetch
    end

    def translate(*args)
      @template.t(*args)
    end
    alias :t :translate

    def failure_messages
      fetch.failures.reject { |x| !x }.join(', ')
    end

    # def method_missing(name, *args)
    #   Rails.logger.warn "Missing object property '#{ name }' of #{ self.class.name }."
    #   ''
    # end
  end
end
