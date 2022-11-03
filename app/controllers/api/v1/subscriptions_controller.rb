class Api::V1::SubscriptionsController < ApplicationController
    def create
        new_sub = Subscription.new(sub_params)
        if new_sub.save
          render status: 201
        else
          render json: { error: 'Duplicate Title' }, status: 401
        end
      end
    
      private
      def sub_params
        params.permit(:title, :price, :status, :frequency)
      end
end