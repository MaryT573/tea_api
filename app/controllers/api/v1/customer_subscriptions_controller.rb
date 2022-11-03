class Api::V1::CustomerSubscriptionsController < ApplicationController

    def create
        if user = Customer.find_by(email: params[:email]) && subscription = Subscription.find_by(title: params[:title])
            user = Customer.find_by(email: params[:email])  
            subscription = Subscription.find_by(title: params[:title])
            new_sub = CustomerSubscription.create(customer: user, subscription: subscription)
            if new_sub.save
                render status: 201
            else
                render json: { error: 'Already Subscribed' }, status: 401
            end
        else
            render json: { error: 'Invalid Customer or Subscription' }, status: 400
        end
    end
    
end