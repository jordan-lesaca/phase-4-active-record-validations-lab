#author.rb
class Author < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :phone_number, length: {is: 10}
end

#1 => can be created with valid data
#1 => Basic Validations
#1 => Is expected to validate that :name cannot be empty/falsy
#1 => Is expected to validate that :name is case-senstivity unique
#1 => Is expected to validate that the length of :phone_number is 10