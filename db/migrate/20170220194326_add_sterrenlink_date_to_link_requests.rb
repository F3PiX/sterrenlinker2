class AddSterrenlinkDateToLinkRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :link_requests, :sterrenlink_sent_at, :datetime
  end
end
