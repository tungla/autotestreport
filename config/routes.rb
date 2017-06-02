Rails.application.routes.draw do
  resources :testresultcomments
  root "testresults#index"
  get "failed-case" => "testresults#show_failed_case"
  get "analysis" => "testresults#analysis"
  get "report" => "testresults#report"
  post "failed-case" => "testresults#change_review"
  get "/:feature_name" => "testresults#show_feature_detail"
  get "testresults/:id" => "testresults#show"
  resources :testresults
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
