# Preview all emails at http://localhost:3000/rails/mailers/link_mailer
class LinkMailerPreview < ActionMailer::Preview

  def send_link
    LinkMailer.send_link
  end

end
