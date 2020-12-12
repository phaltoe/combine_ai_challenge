# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    name { 'Test Person' }

    trait :confirmed do
      after(:create, &:confirm)
    end
  end

  factory :meeting, class: 'Meeting' do
    name { 'Test Meeting' }

    trait :confirmed do
      after(:create, &:confirm)
    end
  end

  factory :record, class: 'Record' do
    start_date { '03:10:20' }
    end_date { '03:11:40' }
    user_id { user.id }
    meeting_id { meeting.id }
  end
end
