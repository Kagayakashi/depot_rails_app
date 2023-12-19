# frozen_string_literal: true

require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert_predicate product, :invalid?
    assert_predicate product.errors[:title], :any?
    assert_predicate product.errors[:description], :any?
    assert_predicate product.errors[:image_url], :any?
    assert_predicate product.errors[:price], :any?
  end

  test "product price must be positive" do
    product = Product.new(title: "My Test Book",
                          description: "My Description",
                          image_url: "lorem.jpg")
    product.price = -1
    assert_predicate product, :invalid?
    assert_equal ["must be greater than or equal to 0.0"], product.errors[:price]

    product.price = -0.00001
    assert_predicate product, :invalid?
    assert_equal ["must be greater than or equal to 0.0"], product.errors[:price]

    product.price = 0.00
    assert_predicate product, :valid?
  end

  test "image url must be valid" do
    ok = %w[fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://aa.bb.cc/x/y/z/fred.GIF]
    bad = %w[fred.doc fred fred.gif/more fred.gif.more]

    ok.each do |image_url|
      assert_predicate new_product_with_image(image_url), :valid?, "#{image_url} must be valid"
    end

    bad.each do |image_url|
      assert_predicate new_product_with_image(image_url), :invalid?, "#{image_url} must be invalid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: products(:captain_blood).title,
                          description: "My Description",
                          price: 0.99,
                          image_url: "lorem.jpg")
    assert_predicate product, :invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  def new_product_with_image(image_url)
    Product.new(title: "My Test Book",
                description: "My Description",
                price: 0,
                image_url:)
  end
end
