class Firm < ApplicationRecord
  has_many_attached :firm_photos
  has_many :users


  include PgSearch
  pg_search_scope :search_by_name, against: [:name]


  def thumbnail input
    return self.avatars[input].variant(resize: '300x300!').processed
  end

end
