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
end
