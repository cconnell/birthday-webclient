Rails.application.routes.draw do
  get 'birthdays/' => 'birthdays#index'
  get 'birthdays/new' => 'birthdays#new'
  post '/birthdays' => 'birthdays#create'
  
  get 'birthdays/:id' => 'birthdays#show'

  get '/birthdays/:id/edit' => 'birthdays#edit'
  
  patch '/birthdays/:id' => 'birthdays#update'
  delete '/birthdays/:id' => 'birthdays#destroy'

end
