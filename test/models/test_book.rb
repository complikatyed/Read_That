require_relative '../test_helper'

describe Book do
  describe "#all" do
    describe "if there are no books in the database" do
      it "should return an empty array" do
        assert_equal [], Book.all
      end
    end
    describe "if there are books" do
      before do
        create_book("Herland")
        create_book("Guards, Guards")
        create_book("Cranford")
      end
      it "should return an array" do
        # You don't need to be pedantic like this.
        # This is just an example to remind you that you can use multiple "its"
        assert_equal Array, Book.all.class
      end
      it "should return the books in alphabetical order" do
        expected = ["Cranford", "Guards, Guards", "Herland"]
        actual = Book.all.map{ |book| book.name }
        assert_equal expected, actual
      end
    end
  end

  describe "#count" do
    describe "if there are no books in the database" do
      it "should return 0" do
        assert_equal 0, Book.count
      end
    end
    describe "if there are books" do
      before do
        create_book("Herland")
        create_book("Guards, Guards")
        create_book("Cranford")
      end
      it "should return the correct count" do
        assert_equal 3, Book.count
      end
    end
  end
end
