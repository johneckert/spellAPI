class CreateSpells < ActiveRecord::Migration[5.1]
  def change
    create_table :spells do |t|
      t.text :name
      t.text :desc
      t.text :higher
      t.text :page
      t.text :range
      t.text :components
      t.text :material
      t.boolean :ritual
      t.text :duration
      t.boolean :concentration
      t.text :casting_time
      t.integer :level
      t.text :school
      t.text :classes

      t.timestamps
    end
  end
end
