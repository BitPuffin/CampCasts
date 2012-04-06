Camping.goes :Blog

# Anything but a slash ([^/]+)
# Number (\d+)

module Blog::Controllers
	class Index < R '/'
		def get
				@posts = Post.all :select => "title"
				render :index
		end
	end
	
	class Create < R '/new'
		def get
			@post = Post.new
			render :new
		end
		
		def post
			@post.save
		end
	end
	
	class Show < R '/(\d+)'
		def get(id)
			@post = Post.find_by_id(id)
			render :show
		end
	end
end

module Blog::Views
	def layout
		doctype!
		head do
			title 'Blog'
		end
		body do
			h1 'My Blog'
			self << yield
		end
	end
	
	def index
		ul do
			@posts.each do |post|
				li do
					a post.title, :href => R(Show, post.id)
				end
			end
		end
	end
	
	def show
		h2 @post.title
		self << post.content
	end
	
	def new
		h2 "New Blog Post!"
		form :action => R(Create), :method => post do
				textarea @post.title, :name => :title,
					:rows =>1, :cols => 50
					
				br
				
				textarea @post.content, :name => :content,
				:rows => 10, :cols => 50
				
				br
				
				input :type => :submit, :value => "Submit!"
		end
	end
	
	def edit
		h2 "Edit Blog Post!"
		form :action => R(Show, @post.id), :method => post do
			textarea @post.title, :name => :title,
					:rows =>1, :cols => 50
			
			br
				
			textarea @post.content, :name => :content,
				:rows => 10, :cols => 50
				
			br
			
			input :type => :submit, :value => "Submit!"
		end
	end
end

module Blog::Models
	class Post < Base		#ERR: ActiveRecord tells me that the Post table doesn't exist
	end
	
	class PostFields < V 1.0
		def self.change
			create_table Post.table_name do |t|
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
