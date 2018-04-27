class CrateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |u|
      u.string :user_name
      u.string :email
      u.string :password_digest
    end  
  end
end
