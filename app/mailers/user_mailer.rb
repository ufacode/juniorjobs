# frozen_string_literal: true
class UserMailer < ActionMailer::Base
  default from: 'noreply@juniorjobs.com'

  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.name} <#{user.email}>", subject: 'Please confirm your registration')
  end
end
