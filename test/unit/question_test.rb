require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "success matching a text answer" do
    q = questions(:one) #answer is '^one$'
    assert q.match('One')
    assert q.match('one')
    assert q.match('ONE')
    assert q.match('OnE  ')
    assert q.match('  one  ')
  end

  test "failure matching a text answer" do
    q = questions(:one)
    assert_equal false, q.match('two')
    assert_equal false, q.match('a one')
    assert_equal false, q.match('aone')
    assert_equal false, q.match('one up')
  end

end
