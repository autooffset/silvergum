module RequestAuthenticationHelpers
  def sign_in_as(customer)
    visit new_customer_session_path

    fill_in 'Email',    with: customer.email
    fill_in 'Password', with: 'secret123'

    click_button 'Sign in'

    page.should have_content('Sign out')
  end
end

RSpec.configure do |config|
  config.include RequestAuthenticationHelpers,    type: :request,
    example_group: {file_path: /spec\/acceptance/}
end
