require 'spec_helper'

describe "writers/show" do
  before(:each) do
    @writer = assign(:writer, stub_model(Writer,
      :first_name => "First Name",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
  end
end
