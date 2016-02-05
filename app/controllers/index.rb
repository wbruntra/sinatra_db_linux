get '/' do
  erb :index
end

get '/model' do
  erb :my_model
end

get '/list' do
  @models = Model.all
  erb :model_list
end

post '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/list'
	else
		"Sorry, there was an error!"
	end
end
