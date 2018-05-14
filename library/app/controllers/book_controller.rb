class BookController < ApplicationController
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to :action => "show", :id => @book.id
        else
            redirect_to :action => "new"
        end
    end

    def new
        @book = Book.new
        @subjects = Subject.all
    end

    def show
        @book= Book.find(params[:id])
    end

    def list
        @books=Book.all
    end

    def delete
        Book.find(params[:id]).destroy
        redirect_to :action => 'list'
    end


    private

    def book_params
        params.require(:book).permit(:title,:price,:subject_id)
    end
end
