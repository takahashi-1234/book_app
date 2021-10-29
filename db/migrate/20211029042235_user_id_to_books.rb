class UserIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column:books,:user_id,:integer,default:1
  end
end
