class Report < ApplicationRecord
  # has_many :comments, as: :commentable
  include Commentable
end
