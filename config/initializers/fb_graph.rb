# achievement_url = 'http://fbgraphsample.heroku.com/achievements/1'
app = FbGraph::Application.new('678638088844362', :secret => 'e690aa68adfb8e76b040677f92fdf241')

# Register Achievement
# app.achievement! achievement_url

# Fetch Registered Achievements
#achievements = app.achievements

# Unregister Achievement
#achievements.first.destroy