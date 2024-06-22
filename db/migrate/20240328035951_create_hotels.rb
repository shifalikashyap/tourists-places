class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :full_address
      t.string :city
      t.string :pincode
      t.string :contact_number
      
      t.timestamps
    end
  end
end
