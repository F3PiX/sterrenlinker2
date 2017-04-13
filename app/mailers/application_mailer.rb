class ApplicationMailer < ActionMailer::Base
  default from: ENV['STERMAIL']
  # layout 'link_mailer'
end
