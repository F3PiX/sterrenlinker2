class Sterrenlink < ApplicationRecord

  TYPEFORM_UID= ENV['TYPEFORM_V1_0']

  belongs_to :link_request

  before_create :create_link

  private

    def create_link
      self.output_link = compose_url_for(self.link_request)
    end

    def compose_url_for(linkrequest)
      uri = URI.parse('https://sterren.typeform.com/to/'+ TYPEFORM_UID)
      uri.query = URI.encode_www_form(
          "oz" => linkrequest.research_proposal,
          "pv" => linkrequest.patient_org,
          "fns" => linkrequest.fonds
      )
      uri.to_s.gsub('+', '%20')
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
