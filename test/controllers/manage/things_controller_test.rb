require 'test_helper'

describe Manage::ThingsController do
  before { sign_in create(:user) }
  describe 'a POST to #create' do
    describe 'with valid attributes' do
      before { post :create, thing: attributes_for(:thing) }

      it 'should render successfully with flash' do
        assert_response :redirect
        assert_flash :success
      end
    end

    describe 'with invalid attributes' do
      before { post :create, thing: { name: nil } }

      it 'should render #new' do
        assert_response :success
        assert_template :new
        assert_flash :error
      end
    end
  end

  describe 'a GET to #edit' do
    before do
      thing = build_stubbed(:thing)

      Thing.stub(:find, thing) do
        get :edit, id: thing
      end
    end

    it 'should render successfully' do
      assert_response :success
      assert_template :edit
    end
  end

  describe 'a GET to #index' do
    before { get :index }

    it 'should render successfully' do
      assert_response :success
      assert_template :index
    end
  end

  describe 'a GET to #new' do
    before { get :new }

    it 'should render successfully' do
      assert_response :success
      assert_template :new
    end
  end

  describe 'a PUT to #update' do
    before{ @thing = build_stubbed(:thing) }

    describe 'with valid attributes' do
      before do
        @thing.stub(:update_attributes, true) do
          Thing.stub(:find, @thing) do
            put :update, id: @thing, thing: attributes_for(:thing)
          end
        end
      end

      it 'should render successfully with flash' do
        assert_response :redirect
        assert_flash :success
      end
    end

    describe 'with invalid attributes' do
      before do
        @thing.stub(:update_attributes, false) do
          Thing.stub(:find, @thing) do
            put :update, id: @thing, thing: { name: nil }
          end
        end
      end

      it 'should render #edit' do
        assert_response :success
        assert_template :edit
      end
    end
  end
end
