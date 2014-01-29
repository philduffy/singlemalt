require 'test_helper'

describe ExperiencesController do
  describe 'a GET to #index' do
    before { get :index }

    it 'should render successfully' do
      assert_response :success
      assert_template :index
    end
  end
end
