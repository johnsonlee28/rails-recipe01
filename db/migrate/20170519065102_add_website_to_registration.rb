class AddWebsiteToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :website, :string
  end
end
