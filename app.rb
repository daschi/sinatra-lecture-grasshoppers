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
	erb :coaches
end

get '/coaches/new' do
	erb :new 
end

post '/coaches/create' do
	# this route actually adds the coach
	# it accepts some params
	# params: {"coach_name"=>"Daniela"}
	coach = params['coach_name']
	Coach.create(coach)
	redirect '/coaches'
	# Send user back to list of coaches after they add one
end

get '/coaches/:coach' do
	@name = params['coach']
	erb :show 
	# Hypothetically we'd want to check if the coach exists first, and redirect them if the coach does not exist in the database. For now we can use any wildcard and it would work.

	# the :coach in the route is called a wildcard and will take any word in its place and display the show page. 

end

post '/coaches/delete/:coach' do
	coach = params['coach']
	Coach.delete(coach)
	redirect '/coaches'
end

	# Instance variables defined in the route can be used in the specified ERB file.

	# ap @coaches # Using ap here is just to see it in terminal, it doesn't affect the erb file.

	# You have to use instance variables not local
	# grasshoppers = 'awesome' <-- won't work in erb	

	# get creates a scope, instance variables not available outside of get scope for other gets. However it is available on the page of the route and you can use the instance variable within this page scope. 