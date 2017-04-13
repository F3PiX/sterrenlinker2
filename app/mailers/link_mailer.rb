class LinkMailer < ApplicationMailer

  def send_link(sterrenlink)
    @sterrenlink = sterrenlink
    @applicant  = @sterrenlink.link_request.researcher
    @send_to    = @sterrenlink.link_request.researcher_email
    @oz         = @sterrenlink.link_request.research_proposal
    @pv         = @sterrenlink.link_request.patient_org
    @link_for_pv= @sterrenlink.output_link

    mail(to: @send_to, subject: "Re: Sterrenlink")
    update_date_sent(sterrenlink.link_request)
  end

  def update_date_sent(request)
    request.sterrenlink_sent_at = Time.current
    request.save
  end

end
