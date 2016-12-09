require 'faker'

FactoryGirl.define do
  factory :doctor do
    email { Faker::Internet.free_email }
    password '123456'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sex { %w(Male Female).sample }
    date_of_birth { Faker::Date.between(80.years.ago, 20.years.ago) }
    contact_no { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.street_address }

    factory :doctor_profile do
      education { %w(MBBS MD BSS MSS).sample }
      specialty { %w(Surgeon Neurosurgeon Eye Bone) }
      experience rand(15..25)
      practice_clinic_name { Faker::Company.name }
      clinic_address { Faker::Address.street_address }
      clinic_contact_no { Faker::PhoneNumber.phone_number }
      website { Faker::Internet.url }
      consultation_fee { Faker::Commerce.price }
    end
  end

  factory :patient do
    email { Faker::Internet.free_email }
    password '123456'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sex { %w(Male Female).sample }
    date_of_birth { Faker::Date.between(80.years.ago, 20.years.ago) }
    contact_no { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.street_address }
  end
end