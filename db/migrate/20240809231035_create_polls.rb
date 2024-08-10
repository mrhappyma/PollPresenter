class CreatePolls < ActiveRecord::Migration[7.1]
  def change
    create_table :polls do |t|
      t.string :name
      t.boolean :open
      t.text :options, default: [].to_yaml

      t.timestamps
    end
  end
end
