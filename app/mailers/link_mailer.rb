class LinkMailer < ApplicationMailer

  def send_link(sterrenlink)
    request = sterrenlink.link_request
    @applicant  = request.researcher
    @send_to    = request.researcher_email
    @oz         = request.research_proposal
    @pv         = request.patient_org_with_article
    @link_for_pv= sterrenlink.output_link

    mail(to: @send_to, subject: "Re: Sterrenlink", bcc: ENV['EMAIL'])
  end
end
