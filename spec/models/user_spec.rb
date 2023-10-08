require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }
  let(:attributes) { attributes_for(:user) }

  it 'is valid with valid attributes' do
    expect(described_class.new(attributes)).to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a first_name' do
    user.first_name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a last_name' do
    user.last_name = nil
    expect(user).not_to be_valid
  end
end
