class Api::V1::CustomerSubscriptionsController < ApplicationController

    def create
        if Customer.find_by(email: params[:email]) && Subscription.find_by(title: params[:title])
            user = Customer.find_by(email: params[:email])  
            subscription = Subscription.find_by(title: params[:title])
            new_sub = CustomerSubscription.create(customer: user, subscription: subscription)
            if new_sub.save
                render json: SubscriptionSerializer.new_subscription(new_sub), status: 201
            else
                render json: { error: 'Already Subscribed' }, status: 400
            end
        else
            render json: { error: 'Invalid Customer or Subscription' }, status: 400
        end
    end

    def update 
        if CustomerSubscription.find(params[:id])
            sub = CustomerSubscription.find(params[:id])  
            if sub.active == true
                sub.update(active: false)
                render status: 201
            else
                render json: { error: 'Already Cancelled' }, status: 400
            end
        else
            render json: { error: 'Subscription not found' }, status: 400
        end
    end

end