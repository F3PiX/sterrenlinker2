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
