class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :twitter
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
