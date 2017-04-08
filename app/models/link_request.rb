class LinkRequest < ApplicationRecord
  validates :researcher, :research_org, :research_proposal, :researcher_email,
            :patient_org, :fonds, :application_date, presence: true

  has_many :sterrenlinks # actually: has one

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
