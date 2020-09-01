require "docbase_report"
require "thor"

module DocBaseReport
  class Aggregator
    class << self
      def fetch_posts(from, to)
        Aggregator.new(posts)
      end
    end

    def initialize(posts)
      @posts = posts
    end

    def goodjob_ranking
    end

    def stared_ranking
    end

    def commented_ranking
    end

    def number_of_posts_per_day
    end

    def number_of_posts_per_month
    end

    def number_of_posted_users_per_day
    end

    def number_of_posted_users_per_month
    end
  end
end