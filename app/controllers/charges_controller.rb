class ChargesController < ApplicationController
  
  def new

  #Amount in cents
   @amount = 1500

      @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium account - #{current_user.user_name}",
     amount: @amount
   }

  end

  def create
   
   #Amount in cents
   @amount = 1500

   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "Premium account - #{current_user.email}",
     currency: 'usd'
   )
  
  if
   flash[:notice] = "Thanks for all the money, #{current_user.user_name}! Feel free to pay me again :)"
   redirect_to wikis_path
   current_user.role = 'premium'
   current_user.save!
 else
  flash[:error] = "Oops there was a problem with your dinero!"
end

 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path  
end
end
