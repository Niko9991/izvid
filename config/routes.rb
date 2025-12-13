Rails.application.routes.draw do
  scope "(:locale)", locale: /en|sl/ do
    root "home#index"

    get "home/index"
    get "home/razlaga"
    get "home/razlaga/sl"

    resources :suppliers do
      resources :papers
    end

    resource :session
    resources :passwords, param: :token

    get "reports/supplier_report", to: "reports#supplier_report"
    get "reports/articles_report", to: "reports#articles_report"
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
