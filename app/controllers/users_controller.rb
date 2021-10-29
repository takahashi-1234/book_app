class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])

    @q=@user.favorite_books.ransack(params[:q])
    @books=@q.result(distinct:true).page(params[:page])

    @days=(Date.today.beginning_of_month..Date.today).to_a
    @day_books=@days.map{|item| @books.where(created_at: item.beginning_of_day..item.end_of_day).count}
    @chart=@days.zip(@day_books)
  end
end
