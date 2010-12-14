require 'open-uri'  

desc "General Cron Task"
task :cron => :environment do
  Language.all.each do |language|
    scrape_git_hub_ranks(language)
    scrape_stack_overflow_questions(language)
  end
end

def scrape_git_hub_ranks(language)
  begin
    github_language_name = language.name.sub("#", "%23").sub(" ", "%20")
    language_url = "https://github.com/languages/#{github_language_name}"
    doc = Nokogiri::HTML(open(language_url))
    if doc.css("h1 em strong").text == "the most"
      rank = "1"
    else
      rank = /#(\d+)/.match(doc.css("h1 em").text)[0][1..3]
    end
    GitHubRank.create(:language => language, :rank => rank, :date => Date.today)
  rescue OpenURI::HTTPError => e
    Rails.logger.info("Attempting to open #{language_url} for #{language.name} and got '#{e.message}'")
  end
end

def scrape_stack_overflow_questions(language)
  begin
    stack_overflow_language_name = language.name.sub("#", "%23").sub(" ", "-")
    language_url = "http://stackoverflow.com/questions/tagged?tagnames=#{stack_overflow_language_name}&sort=stats"
    doc = Nokogiri::HTML(open(language_url))
    number_of_questions = doc.css(".summarycount")[0].text.sub(",","").to_i
    StackOverflowQuestion.create(:language => language, :number_of_questions => number_of_questions, :date => Date.today)
  rescue OpenURI::HTTPError => e
    Rails.logger.info("Attempting to open #{language_url} for #{language.name} and got '#{e.message}'")
  end
end
