# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true

  has_rich_text :body
  belongs_to :category

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user

  friendly_id :title, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

  def self.check_update
    Post.all.where(approve: true).each do |post|
      if post.created_at + 10.day < Time.now && post.likes.count.zero?
        post.update(approve: false)
        puts "Post where post.id = #{post.id} unapproved"
      end
    end
  end
end
