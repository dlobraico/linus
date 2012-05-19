require 'spec_helper'

describe "submissions/show" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :headline => "Headline",
      :byline => "Byline",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Headline/)
    rendered.should match(/Byline/)
    rendered.should match(/MyText/)
  end
end
