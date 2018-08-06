module MetaTaggable
  extend ActiveSupport::Concern

  include ActionView::Helpers::AssetUrlHelper

  included do
    before_action :assign_meta_tags
  end

  private

  def assign_meta_tags(options = {})
    defaults = t('meta_tags.defaults')
    options.reverse_merge!(defaults)
    site = options[:site]
    title = options[:title] || "ToDoShare"
    description = options[:description] || "ToDoをみんなでシェアしよう！"
    image = options[:image] || image_url('pikachu.jpg')
    url = options[:url] || "https://secure-ridge-55094.herokuapp.com"

    configs = {
      reverse: true,
      site: site,
      title: title,
      description: description,
      og: {
        url: url,
        title: title || site,
        description: description,
        image: image
      },
      twitter: {
        card: "summary_large_image",
        site: "@#{current_user.twitter_id}"
      }
    }

    set_meta_tags(options)
  end
end