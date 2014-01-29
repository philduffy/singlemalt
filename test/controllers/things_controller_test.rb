require 'test_helper'

describe ThingsController do
  describe 'a GET to #index' do
    before { get :index }

    it 'should render successfully' do
      assert_response :success
      assert_template :index
    end
  end

  describe 'a GET to #show' do
    before { get :show, id: create(:thing) }

    it 'should render successfully' do
      assert_response :success
      assert_template :show
    end
  end
end
