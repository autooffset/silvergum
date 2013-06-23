class Provider < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
