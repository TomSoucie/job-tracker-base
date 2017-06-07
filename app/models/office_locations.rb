class OfficeLocations < ApplicationRecord
  belongs_to :company
  belongs_to :office
end
