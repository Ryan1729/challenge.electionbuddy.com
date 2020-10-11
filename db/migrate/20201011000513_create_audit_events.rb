class CreateAuditEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :audit_events do |t|
      t.references :election, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :column_name
      t.string :table_name
      t.string :old_value
      t.string :new_value

      t.timestamps
    end
  end
end
