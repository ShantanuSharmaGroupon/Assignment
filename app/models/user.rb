class User < ActiveRecord::Base

email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :name, :presence => true,
				 :length => {:maximum => 20 }

validates :email, :presence => true,
		   :format  => { :with => email_regex},
		   :uniqueness => {:case_sensitive =>false}

validates :password, :presence =>true,
          :confirmation =>true,
          :length => {:within =>6..40}




def self.authenticate(login_credentials)
	Rails.logger.info("#{login_credentials}")
	email_addr = login_credentials[:email]
	passwd = login_credentials[:password]
	Rails.logger.info("printing printing printing printing printing printing printingprintingprinting")
	Rails.logger.info(email_addr)
	user = User.find_by_email(email_addr)

	if user.nil? || user.password != passwd
		nil
	else
		user
	end
end

end