class CreateMentees < ActiveRecord::Migration[6.0]
  def change
    create_table :mentees do |t|
      t.string :name
      t.integer :vtu
      t.string :dept
      t.integer :marks

      t.timestamps
    end
  end
end
