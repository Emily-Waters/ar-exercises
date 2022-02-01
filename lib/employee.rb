class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name,:last_name, presence: true
  validates :hourly_rate, numericality:{ in: 40..200 }

  private

  before_create do
    # puts "Password Before #{self.password}"
    if self.password.blank? || self.password.length != 8
      self.password = (0...8).map { (65 + rand(26)).chr }.join if self.password.blank? || self.password.length != 8
    end
  end

  # after_create {puts "Password After #{self.password}"}

end
