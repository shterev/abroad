require 'spec_helper'

describe Participation do
  it { should belong_to :user }
  it { should validate_presence_of :user }

  it { should belong_to :event }
  it { should validate_presence_of :event }
end
