require 'spec_helper'

describe 'Sign up for an account' do
  it "allows people to sign up with an email address and password", :wip => true do
    visit root_path

    click_link 'Sign up'

    fill_in 'Email',            :with => 'me@domain.com'
    fill_in 'Password',         :with => 'supersecret'
    fill_in 'Confirm Password', :with => 'supersecret'
    click_button 'Sign up'

    page.should have_content('Welcome')
    page.should have_content('me@domain.com')
  end
end
