require "rails_helper"

RSpec.describe Person, type: :model do
  describe "associations" do
    it { should have_one :address }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :birthdate }
  end
end
