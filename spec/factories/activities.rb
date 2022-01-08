FactoryBot.define do
  factory :activity do
    author {} # This references user
    sequence(:name) { |n| "Activity #{n}" }
    amount { 20 }

    factory :activity_with_categories do
      transient do
        categories_count { 5 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end
    end
  end
end
