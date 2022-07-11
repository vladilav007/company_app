class Company < ApplicationRecord
    validates :title, :summary, presence: true
    has_many :users
end
