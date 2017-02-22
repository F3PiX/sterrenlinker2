json.extract! link_request, :id,
              :researcher, :research_proposal, :researcher_email, :research_org,
              :patient_org, :fonds, :application_date, :created_at, :updated_at
json.url link_request_url(link_request, format: :json)