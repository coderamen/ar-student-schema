require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,}/ }
  validates :age, numericality: { only_integer: true, less_than_or_equal_to: 4 }
  def name
    "#{first_name} #{last_name}"
  end

  def age
    if Date.today.month < birthday.month
      return Date.today.year - birthday.year - 1
    else
      return Date.today.year - birthday.year
    end
  end
end

# {
#   :key => 'abc',
#   :name => 'aaa'
# }
#
# {
#   key: 'abc'
#   name: 'aaa'
# }
