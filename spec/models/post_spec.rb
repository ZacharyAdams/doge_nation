require 'spec_helper'

describe Post do
  it { should belong_to(:user) }
  describe "#title" do
    it { should have_valid(:title).when("abcd1234", "asd^2jk@%#&!!") }
    it { should_not have_valid(:title).when(nil, "") }
  end
  describe "#body" do
    it { should have_valid(:body).when("abcd1234", "asd^2jk@%#&!!") }
    it { should_not have_valid(:body).when(nil, "") }
  end
end
