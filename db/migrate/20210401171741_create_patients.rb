class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients, id: :uuid do |t|
      t.string :name
      t.datetime :dob
      t.string :email
      t.string :blood_group
      t.datetime :test_date
      t.string :inference
      t.integer :result
      t.timestamps
    end

    create_table :devices, id: :uuid do |t|
      t.string :name
      t.string :mac_address
      t.integer :status
      t.uuid :user_id
      t.timestamps
    end
  end
end
