Rails.application.routes.draw do
  root 'home#index'

  resource 'home' do
    get 'yelp' => 'home#yelp'
    get 'jobs' => 'home#jobs'
  end

end
