# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.00 }
  validates :title, uniqueness: true, length: { minimum: 10 }
  validates :image_url, format: {
    allow_blank: true,
    with: /\A.*(gif|jpg|png)\z/i,
    message: "must be a URL for GIF, JPG or PNG image.",
  }
end
