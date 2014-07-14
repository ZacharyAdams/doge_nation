require 'spec_helper'

describe Reply do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  describe "#body" do
    it { should have_valid(:body).when("abcd1234", "asd^2jk@%#&!!") }
    it { should_not have_valid(:body).when(nil, "") }
  end
end
