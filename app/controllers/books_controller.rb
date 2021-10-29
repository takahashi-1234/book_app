class BooksController < ApplicationController
  def index
    @q=Book.ransack(params[:q])
    @books=@q.result(distinct:true).page(params[:page])

    @days=(Date.today.beginning_of_month..Date.today).to_a
    @day_books=@days.map{|day| @books.where(created_at: day.beginning_of_day..day.end_of_day).count}
    @chart=@days.zip(@day_books)
  end
end