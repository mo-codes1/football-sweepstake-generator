class AddFormToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :form, :string
  end
end
