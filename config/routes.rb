ClojurePopularity::Application.routes.draw do |map|
  root :to => "stack_overflow_questions#index"
  
  resources :git_hub_ranks, :only => [:index]
  resources :stack_overflow_questions, :only => [:index]
  resources :languages do
    member do
      get :git_hub_ranks
      get :stack_overflow_questions
    end
  end
end
