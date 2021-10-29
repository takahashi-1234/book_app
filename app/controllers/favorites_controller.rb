class FavoritesController < ApplicationController
  def create
    book=Book.find(params[:book_id])
    favorite=Favorite.create(user_id: current_user.id , book_id: book.id)
    redirect_back(fallback_location:books_path)
  end

  def destroy
    book=Book.find(params[:book_id])
    book.favorites.find_by(user_id: current_user.id).destroy
    redirect_back(fallback_location:books_path)
  end
end
