require 'spec_helper'

describe "writers/index" do
  before(:each) do
    assign(:writers, [
      stub_model(Writer,
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      stub_model(Writer,
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of writers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
