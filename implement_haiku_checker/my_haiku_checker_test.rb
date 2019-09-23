require 'minitest/autorun'
require_relative 'my_haiku_checker'

class MyHaikuCheckerTest < MiniTest::Test
  def test_tanka
    assert_equal :tanka, MyHaikuChecker.new('奥山に 紅葉踏みわけ 鳴く鹿の 声きくときぞ 秋はかなしき').check
  end

  def test_haiku
    assert_equal :haiku, MyHaikuChecker.new('夏草や 兵どもが 夢の跡').check
  end

  def test_free_verse_haiku
    assert_equal :free_verse_haiku, MyHaikuChecker.new('咳をしても一人').check
  end
end
