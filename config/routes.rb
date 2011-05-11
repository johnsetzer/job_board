JobBoard::Application.routes.draw do

  resources :job_posts, :shallow => true do
    resources :job_responses
  end


  devise_for :users

  root :to => "home#index"
end
