class Product < ApplicationRecord
    include Notifications
    has_many :subscribers, dependent: :destroy
    has_one_attached :featured_image
    has_rich_text :description

    validates :name, presence: true
    validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }

    def inventory_count?
        inventory_count.present? && inventory_count > 0
    end
end
