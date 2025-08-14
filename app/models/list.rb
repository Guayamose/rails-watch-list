class List < ApplicationRecord
  # app/models/list.rb
has_many :bookmarks, dependent: :destroy
has_many :movies, through: :bookmarks

# app/models/bookmark.rb
belongs_to :list
belongs_to :movie
validates :movie_id, uniqueness: { scope: :list_id }

end
