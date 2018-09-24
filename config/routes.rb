Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :admin do
    get "dashboard" => "admin#index"
    get "approve" => "admin#approve"
    get "reject" => "admin#reject"
  end

  scope :api do
    post "registrations" => "registrations#create"
    post "sessions" => "sessions#create"
    get  "balance" => "balances#index"
    get  "transactions" => "transactions#index"

    scope :asset do
      post ':asset_name/buy' => "assets#buy", as: :buy_asset
      post ':asset_name/sell' => "assets#sell", as: :sell_asset
    end

    namespace :cash do
      post :top_up
      post :withdraw
    end
  end
end
