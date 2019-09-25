require 'minitest/autorun'
require_relative 'my_string_wrapper'

class MyStringWrapperTest < MiniTest::Test
  def test_case_like_string
    value = case MyStringWrapper.new('str')
            when String
              :is_this_really_a_string
            else
              :this_is_not_a_string
            end
    assert_equal :is_this_really_a_string, value
  end

  def test_is_not_a_string
    refute MyStringWrapper.new('str').is_a?(String)
  end
end
