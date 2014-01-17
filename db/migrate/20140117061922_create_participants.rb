class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :key
      t.string :product
      t.string :extra
      t.string :extra_product
      t.string :cpu
      t.string :ip

      t.timestamps
    end
  end
end
