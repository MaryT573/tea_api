class SubscriptionSerializer
    def self.new_subscription(data)
      {
        "data": {
          "Subscription_id": data.id
              }
      }
    end
  end