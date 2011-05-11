JobBoard::Application.routes.draw do

  resources :job_posts, :shallow => true do
    resources :job_responses, :except => [:edit, :update]
  end


  devise_for :users

  root :to => "job_posts#index"
end
