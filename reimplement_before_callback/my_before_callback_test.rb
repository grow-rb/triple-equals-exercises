require 'minitest/autorun'
require_relative 'my_before_callback'

class MyBeforeCallbackTest < MiniTest::Test
  def test_symbol_false
    assert_output('') { Foo.new.save }
  end

  def test_symbol_true
    assert_output("foo\n") { Foo.new(42).save }
  end

  def test_string_false
    assert_output('') { Bar.new.save }
  end

  def test_string_true
    assert_output("bar\n") { Bar.new('bar').save }
  end

  def test_proc_false
    assert_output('') { Baz.new.save }
  end

  def test_proc_true
    assert_output("baz\n") { Baz.new(:grow).save }
  end

  def test_no_condition
    assert_output("hoge\n") { Hoge.new.save }
  end

  def test_nil
    assert_output('') { Fuga.new.save }
  end
end
