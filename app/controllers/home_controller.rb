class HomeController < ApplicationController
  def index
  end

  def yelp
    postal_code = LocationService.new.get_location_by_ip(request).postal_code.empty? ? '97217' : LocationService.new.get_location_by_ip(request).postal_code
    search_term = params[:search_term]

    service_response = YelpService.new.search_by_postal_code(postal_code, search_term)

    if service_response.success
      render json: {
                 businesses: service_response.entity,
                 postal_code: postal_code,
             }
    else
      render json: service_response.errors, status: :not_found
    end
  end
end
