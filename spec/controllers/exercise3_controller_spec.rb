require 'rails_helper'

RSpec.describe Exercise3Controller, type: :controller do
  describe 'GET #excercise1' do
    context 'when all params is blank' do
      before do
        get :index, params: { white_shirt_amount: nil, tie_amount: nil, other: nil }
      end

      it 'should return no discount' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when one param is not invalid' do
      before do
        get :index, params: { white_shirt_amount: 1.1, tie_amount: 1, other: { hat_amount: 6 } }
      end

      it 'should return no discount and errors' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).not_to eq({})
      end
    end

    context 'when more than 7 items and have both white shirt and tie' do
      before do
        get :index, params: { white_shirt_amount: 1, tie_amount: 1, other: { hat_amount: 6 } }
      end

      it 'should return discount 12 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(12)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when more than 7 items and have white shirt but no tie' do
      before do
        get :index, params: { white_shirt_amount: 1, tie_amount: 0, other: { hat_amount: 7 } }
      end

      it 'should return discount 7 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(7)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when more than 7 items and have tie but no white shirt' do
      before do
        get :index, params: { white_shirt_amount: 0, tie_amount: 1, other: { hat_amount: 7 } }
      end

      it 'should return discount 7 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(7)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when more than 7 items without white shirt and tie' do
      before do
        get :index, params: { white_shirt_amount: 0, tie_amount: 0, other: { hat_amount: 8 } }
      end

      it 'should return discount 7 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(7)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when less than 7 items but have both white shirt and tie' do
      before do
        get :index, params: { white_shirt_amount: 1, tie_amount: 1, other: { hat_amount: 1 } }
      end

      it 'should return discount 5 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(5)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when less than 7 items and have white shirt but no tie' do
      before do
        get :index, params: { white_shirt_amount: 1, tie_amount: 0, other: { hat_amount: 1 } }
      end

      it 'should return no discount' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when less than 7 items and have tie but no white shirt' do
      before do
        get :index, params: { white_shirt_amount: 0, tie_amount: 1, other: { hat_amount: 1 } }
      end

      it 'should return no discount' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when less than 7 items without white shirt and tie' do
      before do
        get :index, params: { white_shirt_amount: 0, tie_amount: 0, other: { hat_amount: 6 } }
      end

      it 'should return no discount' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).to eq({})
      end
    end
  end

  describe 'GET #excercise2' do
    context 'when all params is blank' do
      before do
        get :index, params: { white_shirt_amount: nil, tie_amount: nil, other: nil }
      end

      it 'should return no discount' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when one param is not invalid' do
      before do
        get :index, params: { white_shirt_amount: 1.1, tie_amount: 1, other: { hat_amount: 6 } }
      end

      it 'should return no discount and errors' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).not_to eq({})
      end
    end

    context 'when more than 7 items and have both white shirt and tie' do
      before do
        get :index, params: { white_shirt_amount: 1, tie_amount: 1, other: { hat_amount: 6 } }
      end

      it 'should return discount 12 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(12)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when less than 7 items but have both white shirt and tie' do
      before do
        get :index, params: { white_shirt_amount: 1, tie_amount: 1, other: { hat_amount: 1 } }
      end

      it 'should return discount 5 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(5)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when more than 7 items without white shirt' do
      before do
        get :index, params: { white_shirt_amount: 0, tie_amount: 1, other: { hat_amount: 7 } }
      end

      it 'should return discount 7 percent' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(7)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when less than 7 items without white shirt' do
      before do
        get :index, params: { white_shirt_amount: 0, tie_amount: 1, other: { hat_amount: 1 } }
      end

      it 'should return no discount' do
        expect(response).to be_successful
        expect(assigns(:discount_percent)).to eq(0)
        expect(assigns(:errors)).to eq({})
      end
    end
  end
end
