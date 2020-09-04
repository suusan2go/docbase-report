require "docbase_report"
require "thor"
require 'docbase'

module DocBaseReport
  class Aggregator
    def initialize(client = nil)
      @client = client || DocBase::Client.new(access_token: ENV["DOCBASE_ACCESS_TOKEN"], team: ENV["DOCBASE_TEAM"])
    end

    def fetch_posts(from, to)
      posts = []
      page = 1
      begin
        res = @client.posts(q: "created_at:#{from}~#{to}", page: page, per_page: 100);
        if res.status != 200
          raise "request failed status:#{res.status} body: #{res.body}"
        end
        new_posts = res.body["posts"]
        posts.concat(new_posts)
        page += 1
      end while new_posts.length == 100
      Summary.new(posts)
    end
  end

  class Summary
    attr_reader :posts
    def initialize(posts)
      @posts = posts
    end

    def good_jobs_ranking
      @posts.sort_by { |post| post["good_jobs_count"] }.reverse
    end

    def stared_ranking
      @posts.sort_by { |post| post["stars_count"] }.reverse
    end

    def commented_ranking
      @posts.sort_by { |post| post["comments"].length }.reverse
    end

    def number_of_posts_per_day
      @posts.group_by { |post| post["created_at"].to_date }.reverse
    end

    def number_of_posts_per_month
      @posts.group_by { |post| post["created_at"].to_date.beginning_of_month }.reverse
    end
  end
end
