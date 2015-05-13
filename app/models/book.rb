class Book
  attr_accessor :name

  def self.all
    Database.execute("select name from books order by name ASC").map do |row|
      book = Book.new
      book.name = row[0]
      book
    end
  end

  def self.count
    Database.execute("select count(id) from books")[0][0]
  end

  # def self.add
  #   Database.execute(" ")
  #   book = Book.new
  #   book.name = row[0]
  #   book
  # end

end
