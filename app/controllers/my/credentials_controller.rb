class My::CredentialsController < My::ApplicationController
  expose(:credential) { current_customer.credentials.build credential_params }

  def create
    if credential.save
      redirect_to [:my, :account]
    else
      render 'new'
    end
  end

  private

  def credential_params
    return {} if params[:credential].nil?

    params.require(:credential).permit(
      :provider_id, :access_key_id, :secret_access_key
    )
  end
end
