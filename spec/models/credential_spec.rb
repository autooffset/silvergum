require 'active_record_spec_helper'
require 'credential'

describe Credential do
  describe '#valid?' do
    it { should validate_presence_of :customer }
    it { should validate_presence_of :provider }
    it { should validate_presence_of :access_key_id }
    it { should validate_presence_of :secret_access_key }
  end
end
