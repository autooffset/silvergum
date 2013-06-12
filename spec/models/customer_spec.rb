require 'spec_helper'

describe Customer do
  describe '#valid?' do
    it { should validate_presence_of :email }
  end
end
