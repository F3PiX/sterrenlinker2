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


  it 'must have a reference to a link request' do
    sterrenlink.link_request_id = nil
    expect(sterrenlink).not_to be_valid
  end

  it 'is associated with a link_request' do
    # link_request.save
    # link_request.reload
    expect(sterrenlink).to respond_to(:link_request)
  end

  it 'returns the correct url' do
    link_request.save
    # temp, update when url composing is finished :
    sample_url = "https://www.typeform.com/key_UID_#{link_request.id}"
    expect(sterrenlink.output_link).to eq(sample_url)
  end

  it 'is created when a new link request is created' do
   pending("This test is already covered in: link_request_spec")
    fail
  end
end