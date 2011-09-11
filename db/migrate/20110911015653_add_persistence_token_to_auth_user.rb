class AddPersistenceTokenToAuthUser < ActiveRecord::Migration
  def change
    add_column :auth_user, :persistence_token, :string, {:null => true}
  end
end
