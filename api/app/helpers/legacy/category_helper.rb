module Legacy
  module CategoryHelper
    def transpose_category(old_category)
      Category.find_by_name(category_dictionary.fetch(old_category.to_sym))
    end

    private

    def category_dictionary
      {
        'Music': 'music',
        'Television': 'television',
        'Movies': 'movies',
        'Culture': 'culture',
        'Geography': 'geography',
        'Politics': 'politics',
        'Celebrities': 'celebrities',
        'Challenging': 'challenging',
        'Mathematics': 'mathematics',
        'History': 'history',
        'Science': 'science',
        'Gaming': 'gaming',
        'Sports': 'sports',
        'Religion': 'religion',
        'Objects': 'objects',
        'Transportation': 'transportation',
        'Adult': 'adult',
        'Art': 'visual_arts',
        'Literature': 'literature',
        'Misc': 'misc',
        'Funny': 'funny',
        'Food and Drink': 'food_drink',
        'Society': 'society',
        'Nature': 'nature',
        'Technology': 'technology',
        'Language': 'language',
        'Business': 'business',
        'Internet': 'internet',
        'K-pop': 'k_pop',
        'K-drama': 'k_drama',
        'Entertainment': 'entertainment',
        'Animation': 'animation',
        'Anime/Manga': 'anime',
        'Non-English': 'foreign',
        'Chemistry': 'chemistry',
        'Biology': 'biology',
        'Medicine': 'medicine',
        'Telenovelas': 'telenovelas',
      }
    end
  end
end
