class CreateAccountEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :account_events do |t|
      t.string  :event, null: false
      t.integer :account_id, null: false
      t.integer :pmb
      t.string  :company_name
      t.string  :full_name
      t.string  :user_name
      t.string  :email
      t.string  :plan
      t.string  :created_on
      t.string  :registered_on
      t.boolean :is_active

      t.timestamps
    end
  end
end
