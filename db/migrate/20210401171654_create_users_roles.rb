class CreateUsersRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :country_code
      t.string :password
      t.string :auth_token
      t.integer :status
      t.timestamps
    end

    create_table :roles, id: :uuid do |t|
      t.string :name
      t.integer :status
      t.timestamps
    end

    create_table :roles_users, id: false do |t|
      t.uuid :user_id
      t.uuid :role_id
      t.timestamps
    end
  end
end
