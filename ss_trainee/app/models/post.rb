# frozen_string_literal: true

# Class for the posts of blog
class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
end
