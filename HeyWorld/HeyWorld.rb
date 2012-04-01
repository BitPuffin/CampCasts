Camping.goes :HeyWorld

module HeyWorld::Controllers
	class Index < R '/'
		def get
			render :root
		end
	end
	
	class SecretMessage < R '/secret'
		def get
			render :message
		end
	end
end

module HeyWorld::Views
	def layout
		doctype!
		head do
			title "yo lads!"
		end
		body do
			h1 "Cool site"
			self << yield
		end
	end
	
	def root
		p "Hey World!"
	end
	
	def message
		p "Camping is amazing"
	end
end
