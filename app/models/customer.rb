class Customer < ApplicationRecord
    has_many :orders

    validates :email, uniqueness: {case_sensitive: false}, presence: true

end
