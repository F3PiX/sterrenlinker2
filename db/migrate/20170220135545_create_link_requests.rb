class CreateLinkRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :link_requests do |t|
      t.string :researcher
      t.string :research_proposal
      t.string :patient_org

      t.timestamps
    end
  end
end
