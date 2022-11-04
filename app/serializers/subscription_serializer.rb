class SubscriptionSerializer
    def self.new_subscription(data)
      {
        "data": {
          "Subscription_id": data.id
              }
      }
    end

    def self.all_subscriptions(data) 
      {
        "data": {
          "Active": data[:active].map do |sub|
            {
              "Subscription_id": sub[:id]
            }
          end,
          "Cancelled": data[:cancelled].map do |sub|
            {
              "Subscription_id": sub[:id]
            }
          end
        }
      }
    end
  end