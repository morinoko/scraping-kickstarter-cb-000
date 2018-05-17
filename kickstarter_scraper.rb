# require libraries/modules here
require 'nokogiri'

def create_project_hash

  # Use File.read instead of open-uri because it's not a live site
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  projects = kickstarter.css("li.project.grid_4").first
  binding.pry

end
