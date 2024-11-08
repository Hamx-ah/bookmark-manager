# db/seeds.rb

# Categories for bookmarks
categories = [ "books", "movies", "music", "food", "travel", "games", "courses", "educational", "other" ]

# Sample names, tags, and descriptions
sample_names = [
  "Learn Ruby on Rails", "Travel Guide", "Music Theory Basics", "Healthy Recipes", "Top 10 Movies",
  "Best Books of 2023", "Introduction to Coding", "World History Overview", "DIY Home Projects",
  "Technology Innovations", "Photography Tips", "Budget Travel Tips", "Learning Guitar", "Science for Beginners",
  "Cooking 101", "Writing Techniques", "Exploring Nature", "Yoga for Beginners", "Basic Math Skills",
  "Meditation Guide", "Language Learning Tips", "Classic Literature", "Healthy Lifestyle", "Space Exploration",
  "Ancient Civilizations", "Gardening Tips", "Self Improvement", "Understanding Economics", "Poetry 101",
  "Digital Marketing", "Computer Programming", "Art and Creativity", "Public Speaking", "Basic Chemistry",
  "Mindfulness Practices", "Popular Video Games", "Social Media Guide", "Home Workouts", "Interior Design Ideas",
  "Investing Basics", "Art History", "Best New Albums", "Climate Change Overview", "Wildlife Photography",
  "Personal Finance Tips", "Resume Writing", "Freelancing Guide", "Psychology Basics", "Understanding Cultures",
  "Physics for Beginners"
]

sample_urls = [
  "https://example.com/rails", "https://example.com/travel", "https://example.com/music", "https://example.com/recipes",
  "https://example.com/movies", "https://example.com/books", "https://example.com/coding", "https://example.com/history",
  "https://example.com/DIY", "https://example.com/technology", "https://example.com/photography", "https://example.com/budget-travel",
  "https://example.com/guitar", "https://example.com/science", "https://example.com/cooking", "https://example.com/writing",
  "https://example.com/nature", "https://example.com/yoga", "https://example.com/math", "https://example.com/meditation",
  "https://example.com/language-learning", "https://example.com/literature", "https://example.com/health", "https://example.com/space",
  "https://example.com/ancient-civilizations", "https://example.com/gardening", "https://example.com/self-improvement",
  "https://example.com/economics", "https://example.com/poetry", "https://example.com/marketing", "https://example.com/programming",
  "https://example.com/art", "https://example.com/public-speaking", "https://example.com/chemistry", "https://example.com/mindfulness",
  "https://example.com/games", "https://example.com/social-media", "https://example.com/workouts", "https://example.com/design",
  "https://example.com/investing", "https://example.com/art-history", "https://example.com/albums", "https://example.com/climate",
  "https://example.com/wildlife", "https://example.com/finance", "https://example.com/resume", "https://example.com/freelancing",
  "https://example.com/psychology", "https://example.com/cultures", "https://example.com/physics"
]

sample_tags = [ "learning", "fun", "coding", "history", "science", "cooking", "travel", "DIY", "sports", "technology", "review", "beginner", "advanced" ]
sample_descriptions = [
  "An interesting resource for learning and exploration.",
  "A comprehensive guide to mastering skills.",
  "An insightful article with lots of valuable information.",
  "A beginner's guide with step-by-step instructions.",
  "Highly recommended for enthusiasts and learners alike.",
  "A go-to resource for entertainment and knowledge.",
  "Exploring new ideas and thoughts.",
  "A fun way to spend your free time.",
  "Educational and inspiring.",
  "A must-read for everyone interested in this topic."
]

# Shuffle the URLs to ensure uniqueness
shuffled_urls = sample_urls.shuffle

# Generate 50 sample bookmarks
50.times do |i|
  name = sample_names[i % sample_names.size] # Cycle through sample_names if there are less than 50 names
  url = "#{shuffled_urls[i]}/#{i}" # Get a unique URL from the shuffled list
  category = categories.sample # Randomly pick one of the predefined categories
  tags = sample_tags.sample(3).join(", ") # Pick 3 random tags and join them with commas
  description = sample_descriptions.sample # Randomly select a description

  # Create the mark entry
  Mark.create!(
    name: name,
    url: url,
    category: category,
    tags: tags,
    description: description,
    user_id: 1
  )
end

puts "Database seeded with 50 unique bookmarks."
