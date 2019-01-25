# frozen_string_literal: true

# This is an ApplicationMailer class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
