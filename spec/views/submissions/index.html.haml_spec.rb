require 'spec_helper'

describe "submissions/index" do
  before(:each) do
    assign(:submissions, [
      stub_model(Submission,
        :headline => "Headline",
        :byline => "Byline",
        :body => "MyText"
      ),
      stub_model(Submission,
        :headline => "Headline",
        :byline => "Byline",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of submissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Headline".to_s, :count => 2
    assert_select "tr>td", :text => "Byline".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
