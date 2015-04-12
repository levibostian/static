require './lib/static.rb'
require 'test/unit'

class TestStatic < Test::Unit::TestCase
  
  def test_sample
    assert_equal(4, 2+2)
  end
  
end
