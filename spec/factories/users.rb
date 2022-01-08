FactoryBot.define do
  sequence :email do |n|
    "user#{n}@gmail.com"
  end

  sequence :name do |n|
    "User #{n}"
  end

  factory :user do
    name
    email
    password { 'secret_token' }
    password_confirmation { 'secret_token' }

    factory :user_with_categories do
      transient do
        categories_count { 3 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end

      factory :user_with_activities do
        transient do
          activities_count { 2 }
        end

        activities do
          Array.new(activities_count) { association(:activity) }
        end
      end
    end
  end
end
