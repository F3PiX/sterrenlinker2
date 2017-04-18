class Sterrenlink < ApplicationRecord

  TYPEFORM_UID= ENV['TYPEFORM_V1_2'] # second version; articles removed from questionnaire
  ORGS_WITH_DE= ['DON', 'VOKK', 'BOSK', 'AVN', 'Cliëntenraad Reade', 'Afasiecliëntengroep', 'F side'] # 'F side' for testing

  belongs_to :link_request

  before_create :compose_link
  after_create :process_email

  private

    def process_email
      send_to_applicant
      update_sent_date
    end

    def compose_link
      self.output_link = compose_url_for(link_request)
    end

    def compose_url_for(linkrequest)
      find_article_for(linkrequest.patient_org)
      byebug
      uri = URI.parse('https://sterren.typeform.com/to/'+ TYPEFORM_UID)
      uri.query = URI.encode_www_form(
          "oz" => linkrequest.research_proposal,
          "pv" => @article + linkrequest.patient_org,
          "fns" => linkrequest.fonds
      )
      uri.to_s.gsub('+', '%20')
    end

    def send_to_applicant
      LinkMailer.send_link(self).deliver_now
    end

    def update_sent_date
      request = self.link_request
      request.sterrenlink_sent_at = Time.current
      request.save
    end

    def find_article_for(patient_org)
      if ORGS_WITH_DE.include? patient_org
        @article = "de "
      else
        @article = ''
      end
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
