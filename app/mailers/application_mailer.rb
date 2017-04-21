class ApplicationMailer < ActionMailer::Base
  default from: ENV['STERMAIL']
  layout 'mailer'
end
