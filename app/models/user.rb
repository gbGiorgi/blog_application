# frozen_string_literal: true

class User < ApplicationRecord
  include SubscriptionConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy

  has_many :likes, dependent: :destroy

  pay_customer stripe_attributes: :stripe_attributes

  has_one_attached :avatar

  enum role: %i[user admin]

  after_initialize :set_default_role, if: :new_record?

  def stripe_attributes(pay_customer)
    {
      address: {
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id # or pay_customer.owner_id
      }
    }
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
