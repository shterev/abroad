require 'spec_helper'

describe User do
  it { should have_many :participations }
  it { should have_many(:events).through(:participations) }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
end
