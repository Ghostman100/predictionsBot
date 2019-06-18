Rails.application.routes.draw do
  get 'image' => 'images#index'
  telegram_webhook Telegram::WebhooksController
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
