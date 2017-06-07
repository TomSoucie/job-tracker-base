class Office < ActiveRecord::Base
  validates :name, presence: true
  validates :neighborhood, presence: true, uniqueness: true
  has_many :office_locations
  has_many :companies, through: :office_locations
end
