class Address < ApplicationRecord
  attr_accessor :filled

  belongs_to :person

  validates_presence_of :street, :city, :state, :postal_code, :country, if: :filled?

  def filled?
    filled != "0"
  end
end
