require 'rails_helper'

RSpec.describe FeedbacksController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/1/feedbacks/new').to route_to('feedbacks#new', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/users/1/feedbacks/1').to route_to('feedbacks#show', user_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/feedbacks/1/edit').to route_to('feedbacks#edit', user_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users/1/feedbacks').to route_to('feedbacks#create', user_id: '1')
    end

    it 'routes to #update' do
      expect(put: '/users/1/feedbacks/1').to route_to('feedbacks#update', user_id: '1', id: '1')
    end
  end
end
