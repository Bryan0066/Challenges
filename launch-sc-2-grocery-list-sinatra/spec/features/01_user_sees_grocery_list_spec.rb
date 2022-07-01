require "spec_helper"

feature "when visiting the groceries index page" do
  scenario "user sees all grocery items that have been stored in the CSV" do
    CSV.open("grocery_list_test.csv", "a", headers: true) do |file|
      name = "tacos"
      file.puts([name])
    end

    visit "/groceries"
    expect(page).to have_content("tacos")
  end

  scenario "user sees all grocery items at root path due to a redirect" do
    CSV.open("grocery_list_test.csv", "a", headers: true) do |file|
      name = "tacos"
      file.puts([name])
    end

    visit "/"
    expect(page).to have_content("tacos")
    expect(current_path).to eq("/groceries")
  end

  scenario "user sees a clickable link to new grocery form page with the correct text and href" do
    visit "/"

    expect(page).to have_link("Add a Grocery Item", href: "/groceries/new")
  end
end
