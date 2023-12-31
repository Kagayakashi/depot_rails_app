# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.00 }
  validates :title, uniqueness: true, length: { minimum: 10 }
  validates :image_url, format: {
    allow_blank: true,
    with: /\A.*(gif|jpg|jpeg|png)\z/i,
    message: "must be a URL for GIF, JPG, JPEG or PNG image.",
  }

  private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, "Line Items present")
        throw :abort
      end
    end
end
