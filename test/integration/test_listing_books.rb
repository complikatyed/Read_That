require_relative '../test_helper'

class TestListingBooks < Minitest::Test

  def test_no_books_to_list
  shell_output = ""
  expected_output = ""
  IO.popen('./whatcha_reading', 'r+') do |pipe|
    expected_output = <<EOS
1. Add a book
2. Edit book info
3. View book list
4. Exit
EOS
    pipe.puts "3"
    expected_output << "No books found. Add a book.\n"
    pipe.close_write
    shell_output = pipe.read
  end
  assert_equal expected_output, shell_output
  end

end
