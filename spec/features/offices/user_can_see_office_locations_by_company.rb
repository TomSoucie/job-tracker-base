require 'rails_helper'
=begin
As a user,
When I visit a specific company page,
I see the name of each of the office locations associated with that company.
=end
describe "User sees office locations for a single company" do
  scenario "a user sees office locations" do
    company = Company.create!(name: "ESPN")
    office = Office.create!(name: "San Francisco", neighborhood: "Mission")
    office_1 = Office.create!(name: "San Franciso", neighborhood: "Financial District")
    office_2 = Office.create!(name: "San Francisco", neighborhood: "Haight")
    office_3 = Office.create!(name: "Denver", neighborhood: "Lodo")
    office_4 = Office.create!(name: "Denver", neighborhood: "Highlands")

    company.office_locations.create!(office_id: office.id)
    company.office_locations.create!(office_id: office_1.id)
    company.office_locations.create!(office_id: office_2.id)
    company.office_locations.create!(office_id: office_3.id)
    company.office_locations.create!(office_id: office_4.id)

    visit company_path(company)

    expect(page).to have_content(office.name)
    expect(page).to have_content(office_1.name)
    expect(page).to have_content(office_2.name)
    expect(page).to have_content(office_3.name)
    expect(page).to have_content(office_4.name)

  end
end
