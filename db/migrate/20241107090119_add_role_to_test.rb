class AddRoleToTest < ActiveRecord::Migration[7.2]
  def change
    add_column :tests, :role, :string
  end
end
