require "docbase_report"
require "thor"
require 'docbase'

module DocBaseReport
  class Aggregator
    def initialize(client = nil)
      @client = client || DocBase::Client.new(access_token: "", team: "") # TODO: load from environment variable
    end

    def fetch_posts(from, to)
      posts = []
      begin
        new_posts = client.posts(q: "created_at:#{from}~#{to}", page: 1, per_page: 100);
        posts.concat(new_posts)
      end while new_posts.length == 100
      Summary.new(posts)
    end
  end

  class Summary
    def initialize(posts)
      @posts = posts
    end

    def good_jobs_ranking
      posts.sort_by { |post| post[:stars_count] }
    end

    def stared_ranking
      posts.sort_by { |post| post[:started_count] }
    end

    def commented_ranking
      posts.sort_by { |post| post[:comments].length }
    end

    def number_of_posts_per_day
      posts.group_by { |post| post[:created_at].to_date }
    end

    def number_of_posts_per_month
      posts.group_by { |post| post[:created_at].to_date.beginning_of_month }
    end
  end
end