# DocBaseReport
A CLI tool to curate popular articles on DocBase. you can make a summary post by the command below.

```bash
$ bundle exec exe/docbase_report docbase_report monthly_report 2020-08-01

# 8月のランキング

## グッジョブランキング

### 1位 34グッジョブ　「とっても人気のある記事」
#{123456}

### 2位 21グッジョブ　「ちょっと人気のある記事」
#{6789}

### 3位 21グッジョブ　「まあまあ人気のある記事」
#{101112}

## スターランキング

### 1位 7スター　「とっても人気のある記事」
#{123456}

### 2位 6スター　「ちょっと人気のある記事」
#{6789}

### 3位 6スター　「まあまあ人気のある記事」
#{101112}


## コメントランキング

### 1位 24コメント　　「とっても人気のある記事」
#{123456}

### 2位 9コメント　「ちょっと人気のある記事」
#{6789}

### 3位 5コメント　「まあまあ人気のある記事」
#{101112}
```



## Installation
```bash
git clone https://github.com/suusan2go/docbase-report
bundle install
```

**This gem is not published yet.**

Add this line to your application's Gemfile:

```ruby
gem 'docbase_report'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docbase_report

## Usage
```bash
# set environment value
$  export DOCBASE_TEAM=<your team name>
$  export DOCBASE_ACCESS_TOKEN=<your token>
# show monthly ranking
$ bundle exec exe/docbase_report docbase_report monthly_report 2020-08-01
```

## TODO
- [ ] implement weekly report command
- [ ] direct publish
- [ ] rename project name
- [ ] publish to ruby gems
- [ ] add test code

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/docbase_report. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DocBaseReport project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/docbase_report/blob/master/CODE_OF_CONDUCT.md).
