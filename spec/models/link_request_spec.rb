require 'rails_helper'

RSpec.describe LinkRequest, type: :model do

  it { should validate_presence_of(:researcher) }
  it { should validate_presence_of(:research_proposal) }
  it { should validate_presence_of(:research_org) }
  it { should validate_presence_of(:researcher_email) }
  it { should validate_presence_of(:patient_org) }
  it { should validate_presence_of(:fonds) }
  it { should validate_presence_of(:application_date) }

  let(:link_request) { LinkRequest.create(
    researcher: "Johan Cruyff",
    research_proposal: "Voordeel vs Nadeel",
    research_org: "Cruyff Academy",
    researcher_email: "cruyffie@example.com",
    patient_org: "F side",
    fonds: "RF",
    application_date: Date.today
  )}

  # 10's: validness
  # 20's: association with sterrenlink

  it '(10) has a valid application' do
    expect(link_request).to be_valid
  end

  it '(20) has an array of sterrenlinks' do
    expect(link_request.sterrenlinks).to eq([])
  end

  it '(25) creates a new sterrenlink on save' do
    link_request.save
    expect(link_request.sterrenlinks.last).to eq(Sterrenlink.last)
  end
end

  # Maud 22/2/17
  # most validations are done now within the Typeform form.
  # when moving the form, more validations are required.

  # == Schema Information
  #
  # Table name: link_requests
  #
  #  id                  :integer          not null, primary key
  #  researcher          :string
  #  research_proposal   :string
  #  patient_org         :string
  #  created_at          :datetime         not null
  #  updated_at          :datetime         not null
  #  researcher_email    :string
  #  research_org        :string
  #  fonds               :string
  #  application_date    :datetime
  #  sterrenlink_sent_at :datetime
  #
