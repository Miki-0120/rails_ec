# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['KEY']
  layout 'mailer'
end
