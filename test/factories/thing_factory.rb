include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :thing do
    name 'Lagavulin'
    url 'http://www.example.com'
    image { fixture_file_upload('test/fixtures/images/lagavulin.jpg', 'image/jpg') }
  end
end
