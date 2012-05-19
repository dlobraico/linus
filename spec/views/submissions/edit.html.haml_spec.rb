require 'spec_helper'

describe "submissions/edit" do
  before(:each) do
    @submission = assign(:submission, stub_model(Submission,
      :headline => "MyString",
      :byline => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => submissions_path(@submission), :method => "post" do
      assert_select "input#submission_headline", :name => "submission[headline]"
      assert_select "input#submission_byline", :name => "submission[byline]"
      assert_select "textarea#submission_body", :name => "submission[body]"
    end
  end
end
