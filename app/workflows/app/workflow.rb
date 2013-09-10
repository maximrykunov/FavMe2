class App::Workflow
  include Monadic::Monad

  def self.unit(value = nil)
    new(value)
  end

  def initialize(value)
    super(value)
    @failures = []
  end

  attr_reader :failures
  def add_failure(failure)
    @failures << failure
  end

  def fail_like_unavailable
    Failure.new(r18n.t.errors.temporarily_unavailable)
  end

  # Stub method, override it
  def authorize
    fail "Implement me!"
  end
end
