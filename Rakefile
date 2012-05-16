namespace :server do
  task :sass do
    Dir.glob("_sass/*.sass").each do |sass|
      css = File.join('_site/css', File.basename(sass, '.sass')) << '.css'

      `sass #{sass} #{css}`
    end
  end

  task :preview do
    puts "Compiling Sass"
    Rake::Task["server:sass"].invoke

    puts "Starting Preview"
    `jekyll --server 5001`
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

task :default => ['server:preview']
