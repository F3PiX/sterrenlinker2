class CreateSterrenlinks < ActiveRecord::Migration[5.0]
  def change
    create_table :sterrenlinks do |t|
      t.string :output_link
      t.references :link_request, foreign_key: true

      t.timestamps
    end
  end
end