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
  let(:other_link_request) { LinkRequest.new(
      researcher: "Johan Cruyff",
      research_proposal: "Voordeel vs Nadeel",
      research_org: "Cruyff Academy",
      researcher_email: "cruyffie@example.com",
      patient_org: "org.nl",
      fonds: "RF",
      application_date: Date.today
  )}
  let(:sterrenlink) { Sterrenlink.create(link_request_id: link_request.id) }
  let(:second_link) { Sterrenlink.create(link_request_id: other_link_request.id) }

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
    sample_url = "https://sterren.typeform.com/to/BK3dsP?oz=Voordeel%20vs%20Nadeel&pv=de%20F%20side&fns=RF"
    puts sterrenlink.output_link
    expect(sterrenlink.output_link).to eq(sample_url)
  end

  it '(22) can leave out the article' do
    other_link_request.save
    another_sample_url = "https://sterren.typeform.com/to/BK3dsP?oz=Voordeel%20vs%20Nadeel&pv=org.nl&fns=RF"
    expect(second_link.output_link).to eq(another_sample_url)
  end

  it '(25) is created when a new link request is created' do
    pending ("This test is already covered in: link_request_spec")
    fail
  end
end