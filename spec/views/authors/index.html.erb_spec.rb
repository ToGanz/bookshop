require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        name: "Name"
      ),
      Author.create!(
        name: "Name2"
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 1
    assert_select "tr>td", text: "Name2".to_s, count: 1
  end
end
