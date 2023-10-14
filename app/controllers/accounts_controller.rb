# frozen_string_literal: true

# AccountsController
class AccountsController < BaseController
  def index
    render json: { data: accounts }, status: :ok
  end

  private

  def accounts
    Account.all
  end
end
