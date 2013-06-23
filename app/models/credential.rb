class Credential < ActiveRecord::Base
  belongs_to :customer
  belongs_to :provider

  validates :customer,          presence: true
  validates :provider,          presence: true
  validates :access_key_id,     presence: true
  validates :secret_access_key, presence: true
end
