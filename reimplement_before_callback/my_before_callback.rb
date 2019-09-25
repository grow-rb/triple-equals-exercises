module MyBeforeCallback
  def self.included(base)
    base.extend ClassMethods
  end

  def save
    execute_before_save
    nil # save
  end

  module ClassMethods
  end
end

class Foo
  include MyBeforeCallback

  def initialize(int = nil)
    @int = int
  end

  before_save :puts_foo, if: :int_is_42

  private

  def puts_foo
    puts :foo
  end

  def int_is_42
    @int == 42
  end
end

class Bar
  include MyBeforeCallback

  def initialize(str = nil)
    @str = str
  end

  before_save :puts_bar, if: '@str == "bar"'

  private

  def puts_bar
    puts :bar
  end
end

class Baz
  include MyBeforeCallback

  def initialize(symbol = nil)
    @symbol = symbol
  end

  before_save :puts_baz, if: Proc.new { @symbol == :grow }

  private

  def puts_baz
    puts :baz
  end
end

class Hoge
  include MyBeforeCallback

  before_save :puts_hoge

  private

  def puts_hoge
    puts :hoge
  end
end

class Fuga
  include MyBeforeCallback

  before_save :puts_hoge, if: nil

  private

  def puts_hoge
    puts :hoge
  end
end
