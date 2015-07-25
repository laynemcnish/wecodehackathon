Rails.application.routes.draw do
  root 'home#index'

  resource 'home' do
    get 'yelp' => 'home#yelp'
  end

end
