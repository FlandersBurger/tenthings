# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.create([
  { name: 'Adult' },
  { name: 'Animation' },
  { name: 'Anime/Manga' },
  { name: 'Art' },
  { name: 'Biology' },
  { name: 'Business' },
  { name: 'Celebrities' },
  { name: 'Challenging' },
  { name: 'Chemistry' },
  { name: 'Culture' },
  { name: 'Entertainment' },
  { name: 'Food and Drink' },
  { name: 'Funny' },
  { name: 'Gaming' },
  { name: 'Geography' },
  { name: 'History' },
  { name: 'Internet' },
  { name: 'K-drama' },
  { name: 'K-pop' },
  { name: 'Language' },
  { name: 'Literature' },
  { name: 'Mathematics' },
  { name: 'Medicine' },
  { name: 'Misc' },
  { name: 'Movies' },
  { name: 'Music' },
  { name: 'Nature' },
  { name: 'Non-English' },
  { name: 'Objects' },
  { name: 'Politics' },
  { name: 'Religion' },
  { name: 'Science' },
  { name: 'Society' },
  { name: 'Sports' },
  { name: 'Technology' },
  { name: 'Telenovelas' },
  { name: 'Television' },
  { name: 'Transportation' },
])

languages = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'languages.json')))

approved_languages = languages.filter do |language|
  [
    'DE', 'EN', 'ES', 'FR', 'HI', 'ID', 'IT', 'JA',
    'KO', 'LA', 'NL', 'PA', 'PT', 'RU', 'TA', 'TH',
    'TL', 'TR', 'ZH'
  ].include?(language['code'])
end

Language.create(approved_languages.map do |language|
  language.slice(*Language.column_names.map(&:to_sym))
end)

approved_languages.each do |approved_language|
  language = Language.find_by_code(approved_language['code'])
  english = Language.find_by_code("EN")
  Translation.create({
    language:,
    source: language,
    translation: approved_language['native'],
  })
  Translation.create({
    language: english,
    source: language,
    translation: approved_language['name'],
  })
end
