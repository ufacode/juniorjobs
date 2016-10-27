# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  # @TODO: fetch ru, en locales from /:locale/:url, default :ru by now
  def set_locale
    I18n.locale = 'ru'
  end
end
