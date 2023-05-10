class Person < ApplicationRecord
  has_one :address, dependent: :destroy

  validates_presence_of :name, :email, :birthdate
end
