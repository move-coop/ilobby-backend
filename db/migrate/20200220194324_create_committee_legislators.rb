class CreateCommitteeLegislators < ActiveRecord::Migration[6.0]
  def change
    create_table :committee_legislators do |t|
      t.belongs_to :legislator, null: false, foreign_key: true
      t.belongs_to :committee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
