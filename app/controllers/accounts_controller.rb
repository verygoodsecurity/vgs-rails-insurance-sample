 class AccountsController < ApplicationController

   def index
     @accounts = Account.all
   end

   def show
     @account = Account.find(params[:id])
   end

   def new
     @account = Account.new
   end

   def edit
     @account = Account.find(params[:id])
   end

   def update
     @account = Account.find(params[:id])
        if @account.update(account_params)
          redirect_to accounts_path
        else
          render :edit
        end
   end

   def create
     @account = Account.new(account_params)
        if @account.save
          redirect_to accounts_path
        else
          render :new
        end
   end

   def destroy
     @account = Account.find(params[:id])
     @account.destroy
     redirect_to accounts_path
   end

   def calculate
     account = Account.find(params[:id])
     quote = HTTParty.post(ENV['API_URL'], :body => {
         :name => account.name,
         :address => account.address,
         :ssn => account.ssn,
         :income => account.income
     }.to_json, :headers =>
         { 'Content-Type' => 'application/json' }, :verify => false)
     account.quote = quote.body
     account.save
     redirect_to accounts_path
   end

   private
    def account_params
      params.require(:account).permit(:name, :address, :ssn, :income)
    end
end
