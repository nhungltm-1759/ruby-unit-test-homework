require 'rails_helper'

RSpec.describe Exercise8Controller, type: :controller do
  describe 'GET #index' do
    context 'when one param is blank' do
      before do
        get :index, params: { age: nil, gender: 0, ticket_booking_day: '2021-03-25T04:14' }
      end

      it 'should return no price' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(0)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when age param is not invalid' do
      before do
        get :index, params: { age: 121, gender: 0, ticket_booking_day: '2021-03-25T04:14' }
      end

      it 'should return no price and error' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(0)
        expect(assigns(:errors)).not_to eq({})
      end
    end

    context 'when gender param is not invalid' do
      before do
        get :index, params: { age: 19, gender: 3, ticket_booking_day: '2021-03-25T04:14' }
      end

      it 'should return no price and error' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(0)
        expect(assigns(:errors)).not_to eq({})
      end
    end

    context 'when booking day param is not invalid type' do
      before do
        get :index, params: { age: 19, gender: 0, ticket_booking_day: 'hahaha' }
      end

      it 'should return no price and error' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(0)
        expect(assigns(:errors)).not_to eq({})
      end
    end

    context 'when booking day param is in the past' do
      before do
        get :index, params: { age: 19, gender: 0, ticket_booking_day: '2000-03-25T04:14' }
      end

      it 'should return no price and error' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(0)
        expect(assigns(:errors)).not_to eq({})
      end
    end

    context 'when child book Tuesday' do
      before do
        get :index, params: { age: 11, gender: 0, ticket_booking_day: '2021-04-06T04:14' }
      end

      it 'should return price 1200' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(1200)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when child book Friday' do
      before do
        get :index, params: { age: 11, gender: 0, ticket_booking_day: '2021-04-09T04:14' }
      end

      it 'should return price 900' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(900)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when female adult book Friday' do
      before do
        get :index, params: { age: 19, gender: 0, ticket_booking_day: '2021-04-09T04:14' }
      end

      it 'should return price 1400' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(1400)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when male adult book Friday' do
      before do
        get :index, params: { age: 19, gender: 1, ticket_booking_day: '2021-04-09T04:14' }
      end

      it 'should return price 1800' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(1800)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when old female book Friday' do
      before do
        get :index, params: { age: 66, gender: 0, ticket_booking_day: '2021-04-09T04:14' }
      end

      it 'should return price 1400' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(1400)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when old male book Friday' do
      before do
        get :index, params: { age: 66, gender: 1, ticket_booking_day: '2021-04-09T04:14' }
      end

      it 'should return price 1800' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(1600)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when child book other days' do
      before do
        get :index, params: { age: 11, gender: 0, ticket_booking_day: '2021-04-08T04:14' }
      end

      it 'should return price 900' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(900)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when adult book other days' do
      before do
        get :index, params: { age: 19, gender: 1, ticket_booking_day: '2021-04-08T04:14' }
      end

      it 'should return price 1800' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(1800)
        expect(assigns(:errors)).to eq({})
      end
    end

    context 'when the old book other days' do
      before do
        get :index, params: { age: 66, gender: 1, ticket_booking_day: '2021-04-08T04:14' }
      end

      it 'should return price 1600' do
        expect(response).to be_successful
        expect(assigns(:ticket_price)).to eq(1600)
        expect(assigns(:errors)).to eq({})
      end
    end
  end
end
