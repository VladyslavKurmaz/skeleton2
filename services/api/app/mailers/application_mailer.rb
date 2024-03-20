# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@domain.com'
  layout 'mailer'
end
