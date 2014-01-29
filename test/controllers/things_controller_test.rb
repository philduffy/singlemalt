require 'test_helper'

describe ThingsController do
  describe 'a GET to #index' do
    context 'when the request is for html' do
      before { get :index }

      it 'should render successfully' do
        assert_response :success
        assert_template :index
      end
    end

    context 'when the request is for atom' do
      before { get :index, format: :atom }

      it 'should render successfully' do
        assert_response :success
        assert_template :index
      end
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
