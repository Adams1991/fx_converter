require 'crono/web'

Rails.application.routes.draw do
  mount Crono::Web, at: '/crono'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
