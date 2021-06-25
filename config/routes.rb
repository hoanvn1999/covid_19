Rails.application.routes.draw do
  get 'filler_covids/new'
  scope "(:locale)", locale: /en|vi/ do
    root "homepage#index"
    get "vietnam", to: "viet_nam_covids#index"
    get "fillter", to: "fillter_covids#index"
  end
end
