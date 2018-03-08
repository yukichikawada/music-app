class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name, presence: true
      t.timestamps
    end
  end
end
