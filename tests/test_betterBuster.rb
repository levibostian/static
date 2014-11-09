require './lib/betterBuster.rb'
require 'test/unit'

class TestBetterBuster < Test::Unit::TestCase
  
  def test_sample
    assert_equal(4, 2+2)
  end
  
end
