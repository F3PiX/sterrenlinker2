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

require 'rails_helper'

RSpec.describe LinkRequest, type: :model do

  it { should validate_presence_of(:researcher) }
  it { should validate_presence_of(:research_proposal) }
  it { should validate_presence_of(:research_org) }
  it { should validate_presence_of(:researcher_email) }
  it { should validate_presence_of(:patient_org) }
  it { should validate_presence_of(:fonds) }
  it { should validate_presence_of(:application_date) }

  # Maud 22/2/17
  # most validations are done now within the Typeform form.
  # when moving the form, more validations are required.

end
