Camping.goes :Blog

# Anything but a slash ([^/]+)
# Number (\d+)

module Blog::Controllers
	class Index < R '/'
		def get
		
		end
	end
	
	class Show < R '/(\d+)'
		def get(id)
		
		end
	end
end

module Blog::Views
	
end

module Blog::Models
	class Post < Base
	end
	
	class PostFields < V 1.0
		def self.change
			create_table Page.table_name do |t|
				t.string	:title
				t.text		:content
				t.timestamps
			end
		end
	end
end

def Blog.create
	Blog::Models.create_schema
end
