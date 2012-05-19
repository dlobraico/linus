require 'spec_helper'

describe "editors/index" do
  before(:each) do
    assign(:editors, [
      stub_model(Editor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username"
      ),
      stub_model(Editor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username"
      )
    ])
  end

  it "renders a list of editors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
  end
end
