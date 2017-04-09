class Sterrenlink < ApplicationRecord
  belongs_to :link_request

  before_create :create_link

  private

    def create_link
      # byebug
      self.output_link = compose_url_for(self.link_request)
    end

    def compose_url_for(linkrequest)
      # temp: create A link. To do: create the real link with params, Typeform key, typeform form uid.
      'https://www.typeform.com/key_UID_params'
    end
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
