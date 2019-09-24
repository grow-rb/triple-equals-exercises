require 'minitest/autorun'
require_relative 'my_hash_checker'

class MyHashCheckerTest < MiniTest::Test
  def test_array
    assert_equal :array, MyHashChecker.new([]).check
  end

  def test_empty
    assert_equal :empty, MyHashChecker.new({}).check
  end

  def test_including_important_key
    assert_equal :important, MyHashChecker.new({important: :foo}).check
  end

  def test_including_dangerous_value
    assert_equal :dangerous, MyHashChecker.new({bar: :dangerous}).check
  end

  def test_compactable
    assert_equal :compactable, MyHashChecker.new({foo: 42, bar: 0, baz: nil}).check
  end

  def test_not_compactable
    assert_equal :not_compactable, MyHashChecker.new({foo: 42, bar: 0}).check
  end
end
