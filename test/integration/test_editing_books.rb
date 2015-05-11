require_relative '../test_helper'

class TestEditingBook < Minitest::Test

  def test_no_books_to_edit
  shell_output = ""
  expected_output = ""
  IO.popen('./whatcha_reading', 'r+') do |pipe|
    expected_output = <<EOS
1. Add a book
2. Edit book info
3. View book list
4. Exit
EOS
    pipe.puts "2"
    expected_output << "No books found. Add a book.\n"
    pipe.close_write
    shell_output = pipe.read
  end
  assert_equal expected_output, shell_output
  end


#   def test_requested_book_does_not_exist
#   shell_output = ""
#   expected_output = ""
#   IO.popen('./whatcha_reading', 'r+') do |pipe|
#     expected_output = <<EOS
# 1. Add a book
# 2. Edit book info
# 3. View book list
# 4. Exit
# EOS
#     pipe.puts "2"
#     expected_output << "No books found. Add a book.\n"
#     pipe.close_write
#     shell_output = pipe.read
#   end
#   assert_equal expected_output, shell_output
#   end

end
