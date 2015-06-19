class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  # validates :cocktail, :ingredient, presence: true

  # validates :ingredient, presence: true, uniqueness: {scope: :cocktail}

end
