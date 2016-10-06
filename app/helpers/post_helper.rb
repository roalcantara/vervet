module PostHelper
  POST_KIND = {
    accident: { icon: 'add_circle_outline', colour: :blue },
    fire: { icon: 'whatshot', colour: 'yellow darken-1' },
    robbery: { icon: 'error_outline', colour: :red }
  }.freeze

  def post_kind_icon(kind)
    content_tag :i, class: 'kind material-icons grey-text tiny' do
      POST_KIND[kind.to_sym][:icon]
    end
  end

  def post_prefix_icon(kind)
    content_tag :i, class: 'material-icons prefix' do
      POST_KIND[kind.to_sym][:icon]
    end
  end

  def fab_post_kind(kind)
    render '/posts/kind/fab',
           colour: POST_KIND[kind.to_sym][:colour],
           icon: POST_KIND[kind.to_sym][:icon],
           kind: kind
  end

  def fab_new_post(kind)
    render '/posts/kind/fab_new',
           colour: POST_KIND[kind.to_sym][:colour],
           icon: POST_KIND[kind.to_sym][:icon],
           kind: kind
  end

  def fabs_post_kinds
    render '/posts/kind/fabs'
  end
end
