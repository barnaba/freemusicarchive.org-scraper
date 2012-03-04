#encoding: utf-8
require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get(ARGV.pop)
i = 0
downloads = []
last_page = page.search('.pagination-full a')[-2].text
loop do
  i+=1
  $stderr.puts "scraping page #{i}/#{last_page}"
  downloads.concat page.search('a.icn-arrow').map {|a| a.attr 'href'}
  next_link = page.search('.pagination-full a').last
  break if next_link.nil? or not next_link.text =~ /next/i
  page = agent.click(next_link)
end
$stderr.puts "scraped #{i} pages, got #{downloads.count} links"
puts downloads.uniq.join("\n")
