class RemoveTitleToContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :title, :string
  end
end
