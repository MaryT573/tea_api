class CustomerSubscription < ApplicationRecord
    belongs_to :customer
    belongs_to :subscription
    validates_uniqueness_of :customer_id, :scope => :subscription_id
end