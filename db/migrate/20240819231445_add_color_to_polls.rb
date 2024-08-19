class AddColorToPolls < ActiveRecord::Migration[7.1]
  def change
    add_column :polls, :color, :string, default: "#ffdbf3"
  end
end
