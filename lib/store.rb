class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length:{ minimum: 3 }
  validates :annual_revenue,  numericality: { only_integer: true, greater_than: 0 }
  validate :men_or_womens_apparel

  def men_or_womens_apparel
    if !self.womens_apparel && !self.mens_apparel
      errors.add :men_or_womens_apparel, message:"Must sell either mens or womens apparel or both"
    end
  end

end
