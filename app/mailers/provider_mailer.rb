class ProviderMailer < ActionMailer::Base
  default from: "hello@plan_your_ce.com"

  def account_rejection(provider, admin_comment=nil)
    @admin_comment = admin_comment
    mail(to: provider.email, subject: "Your registration has been rejected")
  end

  def account_activated(provider)
    mail(to: provider.email, subject: "Your account has been approved")
  end
end
