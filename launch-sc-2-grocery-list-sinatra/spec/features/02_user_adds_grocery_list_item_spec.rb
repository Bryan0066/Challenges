require "spec_helper"

feature "when visiting the new grocery form page" do
  scenario "the user sees the text 'New Grocery Form Page'" do
    visit "/groceries/new"

    expect(page).to have_content("New Grocery Form Page")
  end

  scenario "the user sees a working link back to the groceries index page'" do
    visit "/groceries/new"

    expect(page).to have_link("Groceries Index Page", href: "/groceries")
  end

  context "if the form is submitted correctly (with a name)" do 
    scenario "the form creates a new grocery item and redirects the user to the grocery list page" do
      visit "/groceries/new"
  
      fill_in "Name", with: "Coke Zero"
      click_on "Add"

      expect(page).to have_selector("li")
      expect(page).to have_content("Coke Zero")
    end
  end
  
  context "if the form is submitted incorrectly (without a name)" do
    scenario "the user remains on the new grocery form page" do
      visit "/groceries/new"
      click_on "Add"
  
      expect(page).to have_content("New Grocery Form Page")
    end
  
    scenario "an empty li element is not added to the index page when the form is submitted without a name" do
      visit "/groceries/new"
      click_on "Add"
  
      visit "/groceries"
  
      expect(page).not_to have_selector("li")
    end
  end

end
