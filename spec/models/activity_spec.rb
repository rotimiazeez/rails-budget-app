require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject { FactoryBot.build :activity }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'should have an amount greater than 0' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end
end
