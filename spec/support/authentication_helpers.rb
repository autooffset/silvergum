module RequestAuthenticationHelpers
  def sign_in_as(customer)
    visit new_customer_session_path

    fill_in 'Email',    with: customer.email
    fill_in 'Password', with: 'secret123'

    click_button 'Sign in'

    page.should have_content('Sign out')
  end
end

module ControllerAuthenticationHelpers
  def sign_in(customer = double('Customer'))
    if customer.nil?
      request.env['warden'].stub(:authenticate!).
        and_throw(:warden, {scope: :customer})
    else
      request.env['warden'].stub :authenticate! => customer
    end

    controller.stub current_customer: customer
  end

  def sign_out
    sign_in nil
  end
end

RSpec.configure do |config|
  config.include RequestAuthenticationHelpers,    type: :request,
    example_group: {file_path: /spec\/acceptance/}
  config.include Devise::TestHelpers,             type: :controller
  config.include ControllerAuthenticationHelpers, type: :controller
end

shared_examples_for 'an action that requires authentication' do
  it 'should redirect to the sign in page without authentication' do
    sign_in nil

    call_action

    response.should redirect_to(new_customer_session_path)
  end
end
