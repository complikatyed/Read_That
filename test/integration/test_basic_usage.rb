require_relative '../test_helper.rb'

class TestBasicUsage < Minitest::Test

  def test_exit_method
    shell_output = ""
    expected_output = ""
    IO.popen('./whatcha_reading', 'r+') do |pipe|
      expected_output = main_menu
      pipe.puts "4"
      expected_output << "Go read something!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

end
