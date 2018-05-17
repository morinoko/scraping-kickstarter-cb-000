# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash

  # Use File.read instead of open-uri because it's not a live site
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  kickstarter_projects = kickstarter.css("li.project.grid_4")

  projects = {}
  # projects: kickstarter.css("li.project.grid_4")
  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text
  # location: project.css("ul.project-meta span.location-name").text
  # percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i

  kickstarter_projects.each do |project|

    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {}
  end

  projects

end

# :projects => {
#   "My Great Project"  => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   },
#   "Another Great Project" => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   }
# }
