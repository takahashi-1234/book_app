class Book < ApplicationRecord
  belongs_to:user
  has_many:favorites,dependent: :destroy

  def favorite(user)
    favorites.where(user_id: user.id).exists?
  end
end
