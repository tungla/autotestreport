Rails.application.routes.draw do
  root "testresults#index"
  get "testresults/:feature_name" => "testresults#show"
  get "failed-case" => "testresults#show_failed_case"
  get "analysis" => "testresults#analysis"
  resources :testresults
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
