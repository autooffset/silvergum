require 'spec_helper'

describe My::CredentialsController do
  describe '#create' do
    let(:credential)  { double 'Credential', :attributes= => {}, save: true }
    let(:customer)    { double 'Customer', credentials: credentials }
    let(:credentials) { double build: credential }

    before :each do
      sign_in customer
    end

    it_should_behave_like 'an action that requires authentication'

    def call_action
      post :create, credential: {provider_id: '1'}
    end

    it 'saves the credential object' do
      credential.should_receive :save

      call_action
    end

    it "redirects back to my account page on success" do
      call_action

      response.should redirect_to(my_account_path)
    end

    it "re-renders the new template on failure" do
      credential.stub save: false

      call_action

      response.should render_template('new')
    end
  end
end
