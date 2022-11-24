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
     proxy_url = 'http://' + ENV['VGS_USERNAME'] + ':' + ENV['VGS_PASSWORD'] + '@' + ENV['VGS_VAULT'] + '.SANDBOX.verygoodproxy.com:8080'
     proxy = URI.parse(proxy_url) 
     path = ENV['API_URL'] + '/quote' 
     uri = URI.parse(path) 
     http = Net::HTTP.new(uri.host, uri.port, proxy.host, proxy.port, proxy.user, proxy.password)
     http.use_ssl = true
     http.ca_file = 'sandbox.pem'
     http.verify_mode = OpenSSL::SSL::VERIFY_PEER
     http.verify_depth = 5
     request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' => 'application/json'})
     request.body = { name: account.name, address: account.address, ssn: account.ssn, income: account.income}.to_json
     response = http.request(request)
     account.quote = response.body
     account.save
     redirect_to accounts_path
   end

   private
    def account_params
      params.require(:account).permit(:name, :address, :ssn, :income)
    end
end
