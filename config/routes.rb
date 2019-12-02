Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers
  resources :destinations
  resources :posts

  #custom routes to like post
  patch "/posts/:id/upvote", to: "posts#upvote", as: "upvote_post"
  
end
