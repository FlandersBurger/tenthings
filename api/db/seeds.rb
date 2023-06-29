# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

languages = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'all_languages.json')))

[
  'DE', 'EN', 'ES', 'FR', 'HI', 'ID', 'IT', 'JA',
  'KO', 'NL', 'PA', 'PT', 'RU', 'TA', 'TL', 'TR', 'ZH'
].map do |language|
  Language.find_or_create_by(code: language)
end

categories = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'all_categories.json')))

categories.each do |parent_category|
  parent_category.each do |parent_category_name, subcategories|
    parent_category = Category.find_or_create_by(name: parent_category_name)
    subcategories.map do |subcategory_name|
      Category.find_or_create_by(
        name: subcategory_name,
        parent_category:,
      )
    end
  end
end

commands = JSON.parse(File.read(Rails.root.join('db', 'seeds', 'all_commands.json')))

commands.each do |command|
  Command.find_or_create_by(name: command)
end

Dir.chdir(Rails.root.join('db', 'seeds'))
Dir.glob('*').select { |f| File.directory?(f) }.each do |folder|

  selected_language = Language.find_by_code(folder)

  languages = JSON.parse(File.read(Rails.root.join('db', 'seeds', folder, 'languages.json')))
  languages.each do |translated_language|
    translated_language.each do |code, translation|
      language = Language.find_by_code(code)
      Translation.find_or_create_by(
        language: selected_language,
        source: language,
        translation:,
      )
    end
  end

  categories = JSON.parse(File.read(Rails.root.join('db', 'seeds', folder, 'categories.json')))
  categories.each do |translated_category|
    translated_category.each do |category_name, selected_category|
      parent_category = Category.find_by_name(category_name)
      Translation.find_or_create_by(
        language: selected_language,
        source: parent_category,
        translation: selected_category['name'],
      )
      selected_category['subcategories'].each do |selected_subcategory|
        selected_subcategory.each do |subcategory_name, subcategory_translation|
          subcategory = Category.find_by(name: subcategory_name, parent_category:)
          Translation.find_or_create_by(
            language: selected_language,
            source: subcategory,
            translation: subcategory_translation,
          )
        end
      end
    end
  end

  commands = JSON.parse(File.read(Rails.root.join('db', 'seeds', folder, 'commands.json')))
  commands.each do |translated_command|
    translated_command.each do |name, translation|
      command = Command.find_by_name(name)
      Translation.find_or_create_by(
        language: selected_language,
        source: command,
        translation:,
      )
    end
  end
end
