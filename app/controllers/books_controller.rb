class BooksController
  def index
    if Book.count > 0
      books = Book.all # All of the books in an array
      books.each_with_index do |book, index|
        say("#{index + 1}. #{book.name}")
      end
    else
      say("No books found. Add a book.\n")
    end
  end
end
