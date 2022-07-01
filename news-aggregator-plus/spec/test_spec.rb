require "spec_helper"

# If I do not specify a title, URL, and description, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.

feature "User submits a new article" do

scenario "User inputs a blank field (url, description, or title)" do
  visit "/articles/new"
  fill_in "url", with: ""
  fill_in "title", with: ""
  fill_in "description",	with: "" 
  click_on "submit"
  expect(page).to have_content "Error!"
  click_on "try_again"
  expect(page).to have_content "New Article Form"
  end

# If I specify an invalid URL, I receive an error message, and the submission form is re-rendered with the details I have previously submitted. A URL is valid if it begins with http.

scenario "User inputs an invalid url (sans 'http' infront)" do
  visit "/articles/new"
  fill_in "url", with: "www.youtube.com"
  click_on "submit"
  expect(page).to xpath
  end

end


# If I specify a description that doesn't have 20 or more characters, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.


# The submitted article is not saved in any of the above cases.