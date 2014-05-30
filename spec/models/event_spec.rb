require 'spec_helper'

describe Event do
  it { should have_many :participations }
  it { should have_many(:users).through(:participations) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
end
