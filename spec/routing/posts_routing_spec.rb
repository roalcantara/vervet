require 'rails_helper'

RSpec.describe PostsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/posts').to route_to('posts#index')
    end

    Post.kinds.keys.each do |kind|
      it "routes to #new/#{kind}" do
        expect(get: "/posts/new/#{kind}").to route_to('posts#new', kind: kind)
      end
    end

    it 'routes to #create' do
      expect(post: '/posts').to route_to('posts#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/posts/1').to route_to('posts#destroy', id: '1')
    end
  end
end
