require 'open-uri'  

desc "General Cron Task"
task :cron => :environment do
  Language.all.each do |language|
    begin
      language_url = "http://github.com/languages/#{language.name.gsub(" ", "%20")}"
      doc = Nokogiri::HTML(open(language_url))
      rank = /#(\d+)/.match(doc.css("h1 em").text)[1]
      GitHubRank.create(:language => language, :rank => rank, :date => Date.today)
    rescue OpenURI::HTTPError => e
      Rails.logger.info("Attempting to open #{language_url} for #{language.name} and got '#{e.message}'")
    end
  end
end

# def self.html_for(year, patch_number)
#   open(url_for(year, patch_number))
# end
# 
# def self.attributes_for(year, patch_number)
#   doc = Nokogiri::HTML(html_for(year, patch_number))
#   {
#     :title => doc.css("h2.subtitle").text,
#     :sb_num => "MS#{year}-#{patch_number}",
#     :sb_version => doc.css("p:contains('Version:')").text.gsub("Version: ","V"),
#     :comments => comments_for(doc)
#   }
# end