require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      name: "MyString",
      amount: "9.99",
      user: nil
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input[name=?]", "activity[name]"

      assert_select "input[name=?]", "activity[amount]"

      assert_select "input[name=?]", "activity[user_id]"
    end
  end
end
