class Widget < ApplicationRecord

  validates :upc, uniqueness: true

end
