Rails.application.routes.draw do
  root 'products#list'

  
  get 'products/:id' => 'products#detail'
end
