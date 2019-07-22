require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user=users(:micheal)
    @micropost=Micropost.new(content:"Rehan",user_id:@user.id)
  end
  test "should be valid"do
    assert @micropost.valid?
  end
  test "user id should be present"do
    @micropost.user_id=nill
    assert_not @micropost.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
