require 'spec_helper'

describe UsersHelper do

  describe "gravatar_for" do
    before { @user = User.new(name: "Example", email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar") }

    it "should accept a size argument" do
      assert true, gravatar_for(@user, "40")
    end
  
    it "should operate without the optional size argument" do

      assert true, gravatar_for(@user)
    end
  end
end
