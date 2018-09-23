Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api do
    post "registrations" => "registrations#create"
    post "sessions" => "sessions#create"
    get  "balance" => "balances#index"

    scope :asset do
      post ':asset_name/buy' => "assets#buy", as: :buy_asset
    end
  end
end
