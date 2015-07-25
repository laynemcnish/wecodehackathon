Rails.application.routes.draw do
  root 'home#index'

  resource 'home' do
    get 'yelp' => 'home#yelp'
    get 'jobs' => 'home#jobs'
    get 'glassdoor_reviews' => 'home#glassdoor_reviews'
    get 'search' => 'home#search'
    post 'preferences' => 'home#preferences'
    get 'job_listings' => 'home#job_listings'
    get 'job_show' => 'home#job_show'
  end

end
