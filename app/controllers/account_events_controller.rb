class AccountEventsController < ApplicationController
  API_SECRET = '0948707d125096dbd3bc4264a8bbf8c1'

  def create
    if params[:secret] != API_SECRET
      return head :unauthorized
    end

    account_event = AccountEvent.new
    account_event.event_type   = params[:event_type]
    account_event.account_id   = params[:id]
    account_event.pmb          = params[:pmb]
    account_event.user_name    = params[:user_name]
    account_event.full_name    = params[:full_name]
    account_event.email        = params[:email]
    account_event.company_name = params[:company_name]
    account_event.plan         = params[:plan]
    account_event.is_active    = params[:is_active]
    account_event.created_on   = params[:created_on]
    account_event.registered_on = params[:registered_on]

    account_event.save!

    head :ok
  end
end
