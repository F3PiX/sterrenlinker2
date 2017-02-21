class AddEmailAndOrgAndFondsToLinkRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :link_requests, :researcher_email, :string
    add_column :link_requests, :research_org, :string
    add_column :link_requests, :fonds, :string
  end
end
