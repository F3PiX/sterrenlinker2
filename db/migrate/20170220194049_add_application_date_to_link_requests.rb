class AddApplicationDateToLinkRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :link_requests, :application_date, :datetime
  end
end
