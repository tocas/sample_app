require 'spec_helper'

describe Relationship do

  before(:each) do
    @follower = Factory(:user)
    @followed = Factory(:user, :email => Factory.next(:email))
    
    @relationship = @follower.relationships.build(:followed_id => @followed.id)
  end

  it "should create a new instance given valid attributes" do
    @relationship.save!
  end
  
  describe "validations" do

    it "should require a follower_id" do
      @relationship.follower_id = nil
      @relationship.should_not be_valid
    end

    it "should require a followed_id" do
      @relationship.followed_id = nil
      @relationship.should_not be_valid
    end
  end
end
