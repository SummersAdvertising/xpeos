class AddOtherBrandToParticipant < ActiveRecord::Migration
  def change
  	add_column :participants, :extra_brand, :string
  end
end
