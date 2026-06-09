class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }
      t.string :mobile_number
      t.string :country_code, default: "91"
      t.string :password_digest
      t.timestamps
    end
  end
end
