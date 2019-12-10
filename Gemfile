source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pronto", "0.10.0", path: "pronto"
gem "pronto-brakeman", require: false
gem "pronto-eslint_npm", require: false
gem "pronto-fasterer", require: false
gem "pronto-rails_best_practices", require: false
gem "pronto-reek", require: false
gem "pronto-rubocop", github: "prontolabs/pronto-rubocop", require: false
gem "pronto-stylelint", require: false
gem "rubocop-performance"
gem "rubocop-rails"
gem "rubocop-rspec"
