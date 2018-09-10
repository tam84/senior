class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_many :message_members
  #has_many :email_messages
  has_many :products
  has_many :product_associates
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many_attached :profile_photos

  belongs_to :firm

  has_many :notifications

  has_many :posts, as: :postable

  has_many_attached :documents

  has_many :customer_to_product_associates

  has_many :connections



  
  
  


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

  def to_param
    "#{id}-#{name}".parameterize
  end    

end
