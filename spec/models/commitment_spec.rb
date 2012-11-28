require 'spec_helper'

describe Commitment do
  it { should belong_to(:user) }
  it { should belong_to(:house) }
end
