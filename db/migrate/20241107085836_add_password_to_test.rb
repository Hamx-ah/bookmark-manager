class AddPasswordToTest < ActiveRecord::Migration[7.2]
  def change
    add_column :tests, :password, :string
  end
end
