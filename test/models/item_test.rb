require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "should not be save Item without name" do
    item = Item.new
    assert_not item.save
  end
end
