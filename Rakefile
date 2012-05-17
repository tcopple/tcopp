namespace :site do
  task :preview do
    puts "Starting Preview"
    `jekyll --auto --server 5001`
  end

  task :build do
    `jekyll`
  end

  task :deploy do

  end
end

namespace :post do
  task :create, :title do |t, args|
    post_title = args[:title]
    filename  = "#{post_title.gsub(' ','-').gsub(/[^a-zA-Z0-9\-]/, '').downcase}.textile"

    File.open "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{filename}", 'w' do |file|
      file.puts <<-TEXT
---
layout: post
title: #{post_title}
---

h1. {{ page.title }}

TEXT
    end
  end
end

task :default => ['site:preview']
