require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }
ENV["TEST"] = "true"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


require 'minitest/autorun'
class Minitest::Test
  def setup
    Database.load_structure
    Database.execute("DELETE FROM books;")
  end
end

def create_book(name)
  Database.execute("INSERT INTO books (name) VALUES (?)", name)
end

def main_menu
  "1. Add a book\n2. Edit book info\n3. View book list\n4. Exit\n"
end
