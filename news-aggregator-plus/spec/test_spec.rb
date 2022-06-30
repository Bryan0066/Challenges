require "spec_helper"

RSpec.describe "test" do
  it "tests the test suite" do
    expect(true).to eq true
  end
end

feature "Submitting an article" do

  scenario "User submits a blank title, URL, and description" do
    visit "/articles/new"
    fill_in "title", with: ""
    fill_in "url", with: ""
    fill_in "description", with: ""

    # expect: I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
    expect(page).to have_content ("You can't submit empty forms!")
  end

end


#   If I specify an invalid URL, I receive an error message, and the submission form is re-rendered with the details I have previously submitted. A URL is valid if it begins with http.
#   If I specify a description that doesn't have 20 or more characters, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
#   The submitted article is not saved in any of the above cases.
  