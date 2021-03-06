class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :office_locations
  has_many :offices, through: :office_locations

  def locations(company, location)
    company.offices.where(name: location)
  end
end
