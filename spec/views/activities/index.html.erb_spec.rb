require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        name: "Name",
        amount: "9.99",
        user: nil
      ),
      Activity.create!(
        name: "Name",
        amount: "9.99",
        user: nil
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
