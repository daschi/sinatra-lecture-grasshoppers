require 'sinatra'
require 'awesome_print'

# files
require './models/coach'

get '/' do 
	# ap "Hello world"
	erb :index 
end

get '/coaches' do 
	ap "This is the coaches page!"
	@coaches = Coach.all
	# Instance variables defined in the route can be used in the specified ERB file.
	# ap @coaches # This is just to see it in terminal
	# You have to use instance variables not local
	# @grasshoppers = 'awesome'
	erb :coaches 
end

# get creates a scope, instance variables not available outside of get scope for other gets. However it is available on the page of the route and you can use the instance variable within this page scope. 