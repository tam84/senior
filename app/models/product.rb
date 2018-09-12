class Product < ApplicationRecord
#	belongs_to :assetclass
	belongs_to :category
	has_many :email_messages
	has_many :product_associates
	has_many_attached :images
	has_many_attached :documents
    has_many_attached :videos    
	has_one :product_specific
    belongs_to :firm
    has_many :posts, as: :postable
    has_many_attached :releases
    has_many :youtube_videos, as: :videoable

    enum view_status: {revisando: 0, público: 1, confidencial: 2}   



	accepts_nested_attributes_for :product_specific

    require 'roo'


	def thumbnail input
		return self.images[input].variant(resize: '300x300!').processed
	end

	def self.filter_1 params
		if params["/products"]["management_firm"] == "" and params["/products"]["category_name"] != ""  and params["/products"]["target_return_benchmark_to"] != ""  		
    		print "----------------------"
    		print "management_firm = nil"
    		category_id = Category.find_by(name: params["/products"]["category_name"]).id
    		products = Product.where(['target_return_benchmark_to > ? and category_id = ?', params["/products"]["target_return_benchmark_to"], category_id]).includes(:product_associates, :category)		
    

		elsif params["/products"]["management_firm"] == "" and params["/products"]["category_name"] == ""  and params["/products"]["target_return_benchmark_to"] != ""  		
    		print "----------------------"
    		print "management_firm = nil and category_name == nil"
    		products = Product.where(['target_return_benchmark_to > ? ', params["/products"]["target_return_benchmark_to"]]).includes(:product_associates, :category)		
    	

		elsif params["/products"]["management_firm"] == "" and params["/products"]["category_name"] == ""  and params["/products"]["target_return_benchmark_to"] == ""  		
    		print "----------------------"
    		print "management_firm = nil and category_name == nil and target_return == nil"
    		products = Product.all.includes(:product_associates, :category)
    	

		elsif params["/products"]["management_firm"] != "" and params["/products"]["category_name"] == ""  and params["/products"]["target_return_benchmark_to"] == ""  		
    		print "----------------------"
    		print "category_name == nil and target_return == nil"
    		products = Product.where(management_firm: params["/products"]["management_firm"]).includes(:product_associates, :category)
    	

		elsif params["/products"]["management_firm"] == "" and params["/products"]["category_name"] != ""  and params["/products"]["target_return_benchmark_to"] == ""  		
    		print "----------------------"
    		print "target_return == nil and management_firm = nil"
    		category_id = Category.find_by(name: params["/products"]["category_name"]).id
    		products = Product.where(['category_id = ?', category_id]).includes(:product_associates, :category)		    	


		elsif params["/products"]["management_firm"] != "" and params["/products"]["category_name"] != ""  and params["/products"]["target_return_benchmark_to"] != ""  		
    		print "----------------------"
    		print "tudo preenchido"
    		category_id = Category.find_by(name: params["/products"]["category_name"]).id
    		products = Product.where(['target_return_benchmark_to > ? and category_id = ? and management_firm = ?', params["/products"]["target_return_benchmark_to"], category_id, params["/products"]["management_firm"]]).includes(:product_associates, :category)		    	
    	end
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
