class GlassdoorService

  def initialize
  end

  def search_by_company_name(ip_address, company_name)
    partner_id = ENV["GLASSDOOR_PARTNER_ID"]
    api_key = ENV["GLASSDOOR_API_KEY"]

    url  = "http://api.glassdoor.com/api/api.htm?t.p=#{partner_id}&t.k=#{api_key}&userip=#{ip_address}&useragent=&format=json&v=1&action=employers&q=#{company_name}&l=portland"
    response = HTTPClient.new.get url
    parsed_response = JSON.parse(response.body)
    if parsed_response.any?
      result = consolidate(parsed_response["response"]["employers"])
      ServiceResponse.build_success(result)
    end
  end


  private

  def consolidate(response)
    response.map { |job|
      {
        company_name: job["name"],
        industry: job["industry"],
        logo_img_url: job["squareLogo"],
        work_life_balance_rating: job["workLifeBalanceRating"],
        rating_description: job["ratingDescription"]
      } 
    }.reject { |biz| biz["exactMatch"] == false }
  end

end

