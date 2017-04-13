class LinkMailer < ApplicationMailer

  def send_link(sterrenlink)
    @sterrenlink = sterrenlink
    @applicant  = @sterrenlink.link_request.researcher
    @send_to    = @sterrenlink.link_request.researcher_email
    @oz         = @sterrenlink.link_request.research_proposal
    @pv         = @sterrenlink.link_request.patient_org
    @link_for_pv= @sterrenlink.output_link

    mail(to: @send_to, subject: "Re: Sterrenlink")
  end
end
