class Order < ActiveRecord::Base

	#contact_regex = /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)([2-9]1[02-9]‌​|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/
	contact_regex = /[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/
	#pincode_regex = /[0-9][0-9][0-9][0-9][0-9][0-9]/

	validates :name, :presence => true,
				 :length => {:maximum => 20 }
	validates :contact, :presence => true,
			  :format  => { :with => contact_regex}

	#validates :pincode, :format  => {:with => pincode_regex}
		   

end
