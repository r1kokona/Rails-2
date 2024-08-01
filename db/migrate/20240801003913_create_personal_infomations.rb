class CreatePersonalInfomations < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_informations, id: false do |t|
      t.primary_key :id, :bigint, auto_increment: true
      t.string :name 
      t.string :ruby
      t.string :sex
      t.string :tel
      t.string :mobile
      t.string :mail 
      t.string :zip
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :address5
      t.date :birthday 
      t.timestamps
    end
  end
end
