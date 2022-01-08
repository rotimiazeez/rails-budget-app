require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      name: "MyString",
      amount: "9.99",
      user: nil
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input[name=?]", "activity[name]"

      assert_select "input[name=?]", "activity[amount]"

      assert_select "input[name=?]", "activity[user_id]"
    end
  end
end
