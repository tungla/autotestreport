Rails.application.routes.draw do
  get "testresults/:feature_name" => "testresults#show"
  resources :testresults
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
