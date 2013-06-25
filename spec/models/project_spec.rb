require 'spec_helper'

describe Project do
  it "must be initialized" do
    @project = FactoryGirl.build(:project)
  end
end
