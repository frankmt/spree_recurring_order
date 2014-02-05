require 'spec_helper'

describe Spree::Admin::RecurringOrdersController do
  
  let(:user) { mock_model Spree::User, :last_incomplete_spree_order => nil, :has_spree_role? => true, :spree_api_key => 'fake' }

  before :each do
    controller.stub :spree_current_user => user
    controller.stub :check_authorization
  end

  describe 'index' do

    it 'should get all recurring orders' do
      orders = []
      Spree::RecurringOrder.should_receive(:all).and_return(orders)

      spree_get :index
      assigns(:recurring_orders).should == orders
    end

  end

end