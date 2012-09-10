class HomeController < ApplicationController
http_basic_authenticate_with :name => "admin", :password => "Logic1" 
  def index

  end
  
  def new

  end

  def create
 require 'rubygems'
 require 'nokogiri'
require 'open-uri'
    @loginName = params[:loginName]
    @wikiName = params[:wikiName]
    @fullName = params[:fullName]
    @email = params[:email_id]
 f = File.open('/home/ram/sriram/ruby/userdatabase.xml')
	@items = Nokogiri::XML(f)
      
	# adding user element to root to add new user with all attributes 
	price = Nokogiri::XML::Node.new "user", @items
	#price.content = "fullName= #{@third}"

	# get the input values from command to save the user details and to create a new user
array = @items.xpath('//users/user')
	 array.each  do |node|
			end
	total = array.count
	length= 0 
	array.each do |node|
			length=length+1
			if total == length
			
			node.add_next_sibling( "\n"+"<user loginName=#{@loginName} wikiName=#{@wikiName} fullName=#{@fullName} email=#{@email} password=\"{SHA}9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684\" created=\"2010.11.13 at 07:38:42:534 PST\" lastModified=\"2012.04.04 at 22:43:06:426 PDT\" />" )
					
			end
		   end
	# update the file with all modification 
	file = File.open("/home/ram/sriram/ruby/userdatabase.xml",'w')
		#raise File.read('/home/ram/sriram/ruby/userdatabase.xml').inspect

	file.puts @items.to_xml
#raise File.read('/home/ram/sriram/ruby/userdatabase.xml').inspect
	#close the file which is opened 
	file.close
  render "show"
  end
end
