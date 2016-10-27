# frozen_string_literal: true
class UserMailer < ActionMailer::Base
  default from: 'noreply@juniorjobs.com'

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Please confirm your registration')
   end

  def successful_create(user)
    @user = user
    mail(to: @user.email, subject: 'Profile was successful created')
  end
end
