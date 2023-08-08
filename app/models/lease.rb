class Lease < ApplicationRecord
    belongs_to :apartment
    belongs_to :tenant

    validates :rent, presence: true

    # validates :name, presence: true
end
