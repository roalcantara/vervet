require 'rails_helper'

RSpec.describe PostsController do
  let(:author) { create :author }
  let(:valid_attributes) { attributes_for(:post).merge(author_id: author.id) }
  let(:invalid_attributes) { attributes_for :post, description: nil }
  before { @post = create :post, author: author }

  describe 'GET #index' do
    it 'assigns all posts as @posts' do
      get :index, params: {}
      expect(assigns(:posts)).to eq([@post])
    end
  end

  describe 'GET #new' do
    Post.kinds.keys.each do |kind|
      it 'assigns a new post as @post' do
        get :new, params: { kind: kind }
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe 'POST #create' do
    before { expect(controller).to receive(:current_user).and_return author }
    context 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create, params: { post: valid_attributes }
        end.to change(Post, :count).by(1)
      end

      it 'renders the created post' do
        post :create, params: { post: valid_attributes }
        expect(response).to render_template(partial: '_post')
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved post as @post' do
        post :create, params: { post: invalid_attributes }
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 're-renders the "form" partial' do
        post :create, params: { post: invalid_attributes }
        expect(response).to render_template(partial: '_form')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      id = @post.to_param
      expect do
        delete :destroy, params: { id: id }
      end.to change(Post, :count).by(-1)
    end

    it 'renders OK' do
      delete :destroy, params: { id: @post.to_param }
      expect(response.status).to eq 200
    end
  end
end
