require 'rails_helper'

RSpec.describe Employee, type: :model do
  before(:all) do
    @employee = create(:employee)
  end

  it "is valid with valid attributes" do
    expect(@employee).to be_valid
  end

  it "is not valid without name attribute" do
    employee = build(:employee, name: nil)
    expect(employee).to_not be_valid
  end

  it "is not valid without email attribute" do
    employee = build(:employee, email: nil)
    expect(employee).to_not be_valid
  end

  it "is not valid without manager attribute" do
    employee = build(:employee, manager_id: nil)
    expect(employee).to_not be_valid
  end
end
