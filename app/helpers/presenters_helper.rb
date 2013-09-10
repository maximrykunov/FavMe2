module PresentersHelper
  def site
    @site ||= SitePresenter.new(self)
  end

  # def registration
  #   @registration_pr ||= RegistrationPresenter.new(self, @registration)
  # end
end
