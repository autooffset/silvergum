require 'active_record_spec_helper'
require 'provider'

describe Provider do
  describe '#valid?' do
    it { should validate_presence_of :name }
  end
end
