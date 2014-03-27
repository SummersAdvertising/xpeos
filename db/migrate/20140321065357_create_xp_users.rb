class CreateXpUsers < ActiveRecord::Migration
  def change
    create_table :xp_users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :address
      t.string :fb_user_id
      t.string :fb_share_id
      t.string :access_token

      t.timestamps
    end
  end
end
