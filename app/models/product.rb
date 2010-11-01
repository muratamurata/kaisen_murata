class Product < ActiveRecord::Base
  has_many :line_items

  validates_presence_of :name, :description, :image_url, :shop_id
  validates_numericality_of :price, :shop_id, :greater_than => 0, :only_integer => true
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i,
                      :message => "はGIF,JPG,PNG画像のURLでなければなりません"
  validates_uniqueness_of :name
  
  validate :price_must_be_a_multiple_of_hundreds

  private
  def price_must_be_a_multiple_of_hundreds
    errors.add(:price,"価格の最少単位は100です。") if (price % 100) != 0
  end
  
  scope :for_sale, :order => "created_at DESC"  
  scope :name_like, lambda {|q| {:conditions => ['name like ?', "%#{q}%"]}}
  scope :recent, lambda {|num| {:limit => num, :order => "created_at DESC"}}
  scope :recommended, :conditions => {:recommended => true}
  belongs_to :shop
end

