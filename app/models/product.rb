class Product < ApplicationRecord
#	belongs_to :assetclass
	belongs_to :category
	has_many :email_messages
	has_many_attached :images
	has_many_attached :documents
  has_many_attached :videos    
  belongs_to :firm
  has_many :posts, as: :postable
  has_many_attached :releases
  has_many :youtube_videos, as: :videoable
  belongs_to :user

  enum view_status: {revisando: 0, público: 1, confidencial: 2}   

  require 'roo'

  validates :name, presence: true
  validates :description, presence: true

	def thumbnail input
		return self.images[input].variant(resize: '300x300!').processed
	end


  def to_param
    "#{id}-#{name}".parameterize
  end    


def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    product = find_by_name(row["name"]) || new
    product.attributes = row.to_hash.slice(*Product.attribute_names())
    product.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::CSV.new(file.path)
  when ".xls" then Roo::Excel.new(file.path)
  when ".xlsx" then Roo::Excelx.new(file.path)
  else raise "Unknown file type: #{file.original_filename}"
  end
end  



end
