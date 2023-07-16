require "rails_helper"

feature "user can search for parks by state" do
  scenario "user submits valid state name" do
    # As a user,

    visit "/"

    # When I select "Tennessee" from the form,
    # (Note: use the existing form)
    select "Tennessee", from: :state
    # And click on "Find Parks",
    click_on "Find Parks"
    expect(current_path).to eq(parks_path)
    # I see the total of parks found,
    expect(page).to have_css(".park", count: 15)
    expect(page).to have_content("Total Number of Parks Found:")
    # And for each park I see:
    # - full name of the park
    # - description
    # - direction info
    # - standard hours for operation

    within(first(".park")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".description")
      expect(page).to have_css(".direction_info")
      expect(page).to have_css(".standard_hours")
    end
  end
end