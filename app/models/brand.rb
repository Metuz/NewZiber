class Brand < ActiveRecord::Base
  has_many :products
  has_many :reports
  has_many :break_products

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
