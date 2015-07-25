class JobService

  def initialize
  end

  def search_by_postal_code(postal_code, search_term)
    url = "http://careers.stackoverflow.com/jobs/feed?location=#{postal_code}?searchTerm=#{search_term}"
    response = Feedjira::Feed.fetch_and_parse url

    if response.entries.any?
      result = consolidate(response)
      ServiceResponse.build_success(result)
    end
  end


  private

  def consolidate(response)
    response.entries.map { |job|
      {
        categories: job.respond_to?("categories") ? job.categories : "no catgories",
        published: job.respond_to?("published") ? job.published : "no published date",
        summary: job.respond_to?("summary") ? job.summary : "no job summary",
        url: job.respond_to?("url") ? job.url : "no job url",
        title: job.respond_to?("title") ? job.title : "no job title"
      } }
  end

end
