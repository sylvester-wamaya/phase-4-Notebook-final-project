class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :notes

      t.timestamps
    end
  end
end
