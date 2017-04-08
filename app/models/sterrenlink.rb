class Sterrenlink < ApplicationRecord
  belongs_to :link_request
end

# == Schema Information
#
# Table name: sterrenlinks
#
#  id              :integer          not null, primary key
#  output_link     :string
#  link_request_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_sterrenlinks_on_link_request_id  (link_request_id)
#
