class LinkRequest < ApplicationRecord

  ORGS_WITH_DE= ['DON', 'VOKK', 'BOSK', 'AVN', 'Cliëntenraad Reade', 'Afasiecliëntengroep', 'F side'] # 'F side' for testing

  validates :researcher, :research_org, :research_proposal, :researcher_email,
            :patient_org, :fonds, :application_date, presence: true

  has_many :sterrenlinks, dependent: :destroy
  # actually: has_one ^

  def patient_org_with_article
    if patient_org.in?(ORGS_WITH_DE)
      "de #{patient_org}"
    else
      patient_org
    end
  end

end

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
