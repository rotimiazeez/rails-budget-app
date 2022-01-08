FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category#{n}" }
    icon { 'https://media.istockphoto.com/' }
    user

    factory :category_with_activities do
      transient do
        activities_count { 3 }
      end

      activities do
        Array.new(activities_count) { association(:activity) }
      end
    end
  end
end
