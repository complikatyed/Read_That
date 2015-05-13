require_relative '../test_helper.rb'


# In order to keep track of the books I'm reading, I want to add a new book information as I begin reading each book.
#   * Book Title
#   * Book Author
#   * Book Genre
#   * Start Date (will be the date information is entered)
#   * Book Rating (will initially be blank)
#   * Book Topic (1 sentence description, will initially be blank)
#   * End Date (will initially be blank)
#
# Usage:
# > `./whatcha_reading`
# > `Do you want to add, edit, or view?`
#  User answers ADD
# > `Please enter the book's title.`
#  User types in title
# > `Please enter the FIRST NAME of the book's author.`
#  User types in author's first name
# > `Please enter the LAST NAME of the book's author.`
#  User types in the author's last name
# > `Does your book have another author? Y or N?`
#  if user types Y, the previous questions are repeated
#  if user types N, the next question prints to screen
#
# > `Please enter the book's GENRE`  {Can we do a dropdown menu?}
# User enters the genre

# > Start date is added automatically based on today's date
# > Rating, Topic, and End date fields are added automatically
#
#  Book information prints to the screen
#
# > `Is this information correct? Y or N?`
#  if user types N, {Need editing commands here - how?}
#  if user types Y, screen prints
# > `"Do you want to add another book?"`
#  if user types N, `EXIT`
#
#  if user types Y, start over with
# >`Please enter the book's title and subsequent steps`
#
#
# Acceptance Criteria:
# * The new book title is added to the database and given a unique id number
# * The book's author (first name, then last name) is added to the record with an author_id number
# * The user is given the option to add multiple author names
# * The book's genre is added to the record
# * The start date is added
# * A space for a book topic is added
# * A space for a star rating is added, but left blank
# * A space for an ending date is added, but left blank
# * The database and accompanying tables are updated


class AddNewBookTest < Minitest::Test


  def test_add_menu_choice_asks_for_title
    shell_output = ""
    expected_output = ""
    IO.popen('./whatcha_reading', 'r+') do |pipe|
      expected_output = <<EOS
1. Add a book
2. Edit book info
3. View book list
4. Exit
EOS
      pipe.puts "1"
      expected_output << "What is the book's title?\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end


end
