require 'minitest/autorun'
require_relative 'my_size_detector'

class MySizeDetectorTest < MiniTest::Test
  def test_xs
    assert_equal :xs, MySizeDetector.new(140).detect
  end

  def test_s
    assert_equal :s, MySizeDetector.new(152).detect
  end

  def test_m
    assert_equal :m, MySizeDetector.new(168).detect
  end

  def test_l
    assert_equal :l, MySizeDetector.new(176).detect
  end

  def test_xl
    assert_equal :xl, MySizeDetector.new(184).detect
  end
end
