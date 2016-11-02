require 'test_helper'

class TimeStampTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should save with valid regexp signature' do
    ts = TimeStamp.new
    ts.signature = '19:25 13.11'
    assert ts.save
  end

  test 'should not save with invalid signature' do
    ts = TimeStamp.new
    ts.signature = '129:235 113.11'
    assert_not ts.save
  end
end
