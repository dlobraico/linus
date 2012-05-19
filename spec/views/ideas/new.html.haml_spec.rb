require 'spec_helper'

describe "ideas/new" do
  before(:each) do
    assign(:idea, stub_model(Idea,
      :headline => "MyText"
    ).as_new_record)
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ideas_path, :method => "post" do
      assert_select "textarea#idea_headline", :name => "idea[headline]"
    end
  end
end
