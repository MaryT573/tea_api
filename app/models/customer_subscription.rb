class CustomerSubscription < ApplicationRecord
    belongs_to :customer
    belongs_to :subscription
    validates_uniqueness_of :customer_id, :scope => :subscription_id
    
    def self.customer_search(id)
        where(customer_id: id)
    end

    def self.subscription_search(id)
        where(subscription: id)
    end
end