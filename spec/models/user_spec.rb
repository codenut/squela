require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.build(:user)
  end

  it "can be instatiated" do
    puts @user.email
    puts @user.user_detail.fullname
    @user.should be_an_instance_of(User)
  end

end
