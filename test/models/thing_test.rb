require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  subject { Thing.new }

  # Validations
  must { validate_presence_of(:image) }
  must { validate_presence_of(:name) }
  must { validate_presence_of(:url) }

  must { allow_value('http://www.single-malt.co').for(:url) }

  wont { allow_value('fake-url').for(:url) }

  # Scopes
  describe 'newest_first' do
    before do
      @old = create(:thing)
      @new = create(:thing)
    end

    subject { Thing.newest_first.to_a }

    it 'must return the new thing first' do
      expectation = [@new, @old]

      subject.must_equal expectation
    end
  end
end
