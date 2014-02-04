module ApplicationHelper
  def experience_header(experience)
    if experience.url.present?
      link_to experience.name, experience.url
    else
      experience.name
    end
  end

  def experience_timeline(experience)
    "#{experience.started_at.stamp('January 2013')} - "\
      "#{experience.ended_at.try(:stamp, 'January 2013')}".strip
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def menu_links(opts = {})
    output = ''

    output << content_tag(:li) do
      link_to 'Awesome Things', things_path
    end

    output << content_tag(:li) do
      link_to 'Past Experiences', experiences_path
    end

    if opts[:social].present?
      output << content_tag(:li) do
        link_to 'Github', 'http://www.github.com/philduffy'
      end

      output << content_tag(:li) do
        link_to 'Twitter', 'http://www.twitter.com/willmanduffy'
      end
    end

    if signed_in?
      output << content_tag(:li) do
        link_to 'Manage Things', manage_things_path
      end

      output << content_tag(:li) do
        link_to 'New Experience', new_manage_experience_path
      end

      output << content_tag(:li) do
        link_to 'Sign Out', destroy_user_session_path, method: :delete
      end
    end

    output.html_safe
  end

  def plex_episode_name(episode)
    "#{episode['grandparent_title']} "\
      "- (S#{episode['parent_index']}E#{episode['index']}) - "\
      "#{episode['title']}"
  end

  def site_header
    link_to 'Philip Duffy', root_path
  end

  def tvdb_image_url(id)
    "http://thetvdb.com/banners/_cache/posters/#{id}-1.jpg"
  end
end
