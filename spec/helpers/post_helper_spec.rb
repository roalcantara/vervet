require 'rails_helper'

RSpec.describe PostHelper do
  describe '#post_prefix_icon' do
    Post.kinds.keys.each do |kind|
      it "renders the icon for the post kind `#{kind}`" do
        expect(helper.post_prefix_icon(kind)).to match('material-icons prefix')
      end
    end
  end

  describe '#fab_post_kind' do
    Post.kinds.keys.each do |kind|
      it "renders a fab for the post kind `#{kind}`" do
        expect(helper).to receive(:render)
          .with('/posts/kind/fab', any_args)
        helper.fab_post_kind(kind)
      end
    end
  end

  describe '#fab_new_post' do
    Post.kinds.keys.each do |kind|
      it "renders a fab for new post kind `#{kind}`" do
        expect(helper).to receive(:render)
          .with('/posts/kind/fab_new', any_args)
        helper.fab_new_post(kind)
      end
    end
  end

  describe '#fabs_post_kinds' do
    it 'renders a list of fabs for each post kind' do
      expect(helper).to receive(:render)
        .with('/posts/kind/fabs')
      helper.fabs_post_kinds
    end
  end
end
