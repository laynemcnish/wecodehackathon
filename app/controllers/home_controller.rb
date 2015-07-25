class HomeController < ApplicationController
  def index
  end

  def search
  end

  def preferences
    @search_term = params["search_term"]
    redirect_to job_listings_home_path({:search_term => @search_term})
  end

  def job_listings
    @params = params

    postal_code = LocationService.new.get_location_by_ip(request).postal_code.empty? ? '97217' : LocationService.new.get_location_by_ip(request).postal_code
    search_term = params[:search_term]

    service_response = JobService.new.search_by_postal_code(postal_code, search_term)
    @jobs = service_response.entity
  end

  def job_show
    postal_code = LocationService.new.get_location_by_ip(request).postal_code.empty? ? '97217' : LocationService.new.get_location_by_ip(request).postal_code
    search_term = params[:search_term]

    service_response = YelpService.new.search_by_postal_code(postal_code, search_term)
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

  def glassdoor_reviews
    company_name = params[:company_name]

    ip_address = LocationService.new.get_location_by_ip(request).ip.empty? ? '71.238.42.189' : LocationService.new.get_location_by_ip(request).ip

    service_response = GlassdoorService.new.search_by_company_name(ip_address, company_name)
    if service_response.success
      render json: {
               companies: service_response.entity
             }
    else
      render json: service_response.errors, status: :not_found
    end
  end


end
