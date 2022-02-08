class AccountCreatedController < ApplicationController
  API_SECRET = '0948707d125096dbd3bc4264a8bbf8c1'

  def create
    if params[:secret] != API_SECRET
      return head :unauthorized
    end

    account_event = AccountEvent.new(params.except(:secret))
    account_event.event = 'account.update'
    account_event.save!

    head :ok
  end
end
