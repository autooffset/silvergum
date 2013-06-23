require 'spec_helper'

describe 'Customer adding server credentials' do
  let(:customer) { Customer.make! }

  before :each do
    Provider.make! name: 'Amazon Web Services'

    sign_in_as customer
  end

  it "AWS credentials" do
    visit my_account_path

    click_link 'Add Credentials'

    select 'Amazon Web Services', from: 'Provider'
    fill_in 'Access Key ID',      with: '12345'
    fill_in 'Secret Access Key',  with: '67890'
    click_button 'Save Credentials'

    visit my_account_path

    page.should have_content('Amazon Web Services 12345')
  end
end
