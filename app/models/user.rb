class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_many :message_members
  #has_many :email_messages
  has_many :products
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many_attached :profile_photos

  belongs_to :firm

  include PgSearch
  pg_search_scope :search_by_full_name, against: [:full_name]



  def name
  	email.split('@')[0]
  end

  def thumbnail input
    return self.avatars[input].variant(resize: '300x300!').processed
  end


  def firm_name user
    firm_name = user.firm.name
  end

end
