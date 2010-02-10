module RedLine
	module Customer
		module InstanceMethods
			def braintree_customer_attributes
				wanted_attributes = Braintree::Customer._create_signature.reject{|a| a.is_a? Hash}.reject{|a| a == :id}
				attributes.symbolize_keys.inject({}) do |rewritten_hash, (original_key, value)|
					rewritten_hash[self.class.braintree_customer.fetch(original_key, original_key)] = value
					rewritten_hash
				end.reject{|key, value| !wanted_attributes.include?(key)}
			end
			def customer
				Braintree::Customer.find(customer_id) if customer_id
			end
			def create_customer
				self.customer_id = Braintree::Customer.create!(braintree_customer_attributes).id
			end
			def update_customer
				Braintree::Customer.update!(customer_id, braintree_customer_attributes) && flush_cache(:customer) if customer_id
			end
			def delete_customer
				if customer_id
					Braintree::Customer.delete(customer_id)
					self.customer_id = nil
				end
			end
		end
	end
end