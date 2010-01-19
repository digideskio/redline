require 'rubygems'
require 'active_record'

class Hash
	def rewrite mapping
		inject({}) do |rewritten_hash, (original_key, value)|
			rewritten_hash[mapping.fetch(original_key, original_key)] = value
			rewritten_hash
		end
	end
end

module RedLine
	def acts_as_braintree_customer(attribute_rewriting)
		send :include, RedLine::Customer
		send 'braintree_customer=', attribute_rewriting
	end
	module Customer
		def self.included(base)
			base.class_eval do
				send :extend, ActiveSupport::Memoizable
				send :include, InstanceMethods
				memoize :customer
				before_create  :create_customer
				before_update  :update_customer
				before_destroy :delete_customer
				cattr_accessor :braintree_customer
			end
		end
		module InstanceMethods
			def braintree_customer_attributes
				wanted_attributes = Braintree::Customer._create_signature.reject{|a| a.is_a? Hash}.reject{|a| a == :id}
				attributes.symbolize_keys.rewrite(self.class.braintree_customer || {}).reject{|key, value| !wanted_attributes.include?(key)}
			end
			def customer
				Braintree::Customer.find(customer_id)
			end
			def create_customer
				self.customer_id = Braintree::Customer.create!(braintree_customer_attributes).id
			end
			def update_customer
				Braintree::Customer.update!(customer_id, braintree_customer_attributes) && flush_cache(:customer)
			end
			def delete_customer
				Braintree::Customer.delete(customer_id)
			end
		end
	end
end

ActiveRecord::Base.extend RedLine