require_relative '../test_helper'

class TestListingBooks < Minitest::Test

  def test_no_books_to_list
  shell_output = ""
  expected_output = ""
  IO.popen('./whatcha_reading', 'r+') do |pipe|
    expected_output = main_menu
    pipe.puts "3"
    expected_output << "No books found. Add a book.\n"
    pipe.close_write
    shell_output = pipe.read
  end
  assert_equal expected_output, shell_output
  end

  def test_listing_multiple_books
    create_book("Herland")
    create_book("Guards, Guards")
    shell_output = ""
    expected_output = ""
    IO.popen('./whatcha_reading', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "3" # List all book titles
      expected_output << "1. Guards, Guards\n"
      expected_output << "2. Herland\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end



end
