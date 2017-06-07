require 'rails_helper'
=begin
As a user,
When I visit a specific company page,
I see the name of each of the office locations associated with that company.
=end
describe "User sees office locations for a single company" do
  scenario "a user sees office locations" do
    company = Company.create!(name: "ESPN")
    office = company.offices.create!(name: "San Francisco", neighborhood: "Mission")
    office_1 = company.offices.create!(name: "San Franciso", neighborhood: "Financial District")
    office_2 = company.offices.create!(name: "San Francisco", neighborhood: "Haight")
    office_3 = company.offices.create!(name: "Denver", neighborhood: "Lodo")
    office_4 = company.offices.create!(name: "Denver", neighborhood: "Highlands")

    visit company_path(company)

    expect(page).to have_current_path(company_path(company))

    expect(page).to have_content(company.name)
    expect(page).to have_content(office.name)
    expect(page).to have_content(office_3.name)
  end

  scenario "a user sees the count of locations by office" do
    company = Company.create!(name: "ESPN")
    office = company.offices.create!(name: "San Francisco", neighborhood: "Mission")
    office_1 = company.offices.create!(name: "San Franciso", neighborhood: "Financial District")
    office_2 = company.offices.create!(name: "San Francisco", neighborhood: "Haight")
    office_3 = company.offices.create!(name: "Denver", neighborhood: "Lodo")
    office_4 = company.offices.create!(name: "Denver", neighborhood: "Highlands")

    visit company_path(company)

    expect(page).to have_current_path(company_path(company))

    expect(page).to have_content(company.name)
    expect(page).to have_content(office.name)
    expect(page).to have_content(3)

    expect(page).to have_content(office_3.name)
    expect(page).to have_content(2)
  end
end
