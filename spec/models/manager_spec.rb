require 'rails_helper'

RSpec.describe Manager, type: :model do
  before(:all) do
    @manager = create(:manager)
  end

  it "is valid with valid attributes" do
    expect(@manager).to be_valid
  end

  it "is not valid without name attribute" do
    @manager.name = nil
    expect(@manager).to_not be_valid
  end
end
