class BooksController < ApplicationController

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(post_image_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to books_path
    end

    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
    end

    private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
