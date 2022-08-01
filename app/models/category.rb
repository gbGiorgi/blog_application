# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: { scope: :name }
end
