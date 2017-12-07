require 'git-trend'

repos = GitTrend.get(:ruby, :weekly)
repos.each do |r|
  puts "#{r.name} (#{r.star_count} stargazers)"
  puts "--- #{r.description}\n\n"
end
