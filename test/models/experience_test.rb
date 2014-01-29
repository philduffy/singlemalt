require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  subject { Experience.new }

  # Validations
  must { validate_presence_of(:description) }
  must { validate_presence_of(:job) }
  must { validate_presence_of(:name) }
  must { validate_presence_of(:started_at) }

  must { allow_value('http://www.single-malt.co').for(:url) }

  wont { allow_value('fake-url').for(:url) }

  # Scopes
  describe 'newest_first' do
    before do
      @old = create(:experience, started_at: 2.years.ago)
      @new = create(:experience, started_at: 1.year.ago)
    end

    subject { Experience.newest_first.to_a }

    it 'must return the new experience first' do
      expectation = [@new, @old]

      subject.must_equal expectation
    end
  end
end
