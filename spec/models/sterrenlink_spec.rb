require 'rails_helper'

RSpec.describe Sterrenlink, type: :model do
  let(:link_request) { LinkRequest.new(
      researcher: "Johan Cruyff",
      research_proposal: "Voordeel vs Nadeel",
      research_org: "Cruyff Academy",
      researcher_email: "cruyffie@example.com",
      patient_org: "F side",
      fonds: "RF",
      application_date: Date.today
  )}
  let(:sterrenlink) { Sterrenlink.create(link_request_id: link_request.id) }

  it '(10) must have a reference to a link request' do
    sterrenlink.link_request_id = nil
    expect(sterrenlink).not_to be_valid
  end

  it '(12) is associated with a link_request' do
    expect(sterrenlink).to respond_to(:link_request)
    expect(sterrenlink.id).to be_nil
    # ^ created but not saved; until the link_request is saved
  end

  it '(20) returns the correct url' do
    link_request.save
    sample_url = "https://sterren.typeform.com/to/RgLBwe?oz=Voordeel%20vs%20Nadeel&pv=F%20side&fns=RF"
    expect(sterrenlink.output_link).to eq(sample_url)
  end

  it '(25) is created when a new link request is created' do
    pending ("This test is already covered in: link_request_spec")
    fail
  end
end