class CreateHorrors < ActiveRecord::Migration[6.1]
  def change
    create_table :horrors do |t|
      t.string :name
      t.string :difficult
      t.string :address
      t.text :about
      t.string :image

      t.timestamps
    end
  end
end
