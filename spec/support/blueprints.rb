require 'machinist/active_record'

Customer.blueprint do
  email                 { "customer-#{sn}@domain.com" }
  password              { 'secret123' }
  password_confirmation { object.password }
end
