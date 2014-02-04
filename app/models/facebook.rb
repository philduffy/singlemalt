class Facebook
  include Singleton

  def initialize
    @facebook = begin
      FbGraph::User.me ENV['FACEBOOK_ACCESS_TOKEN']
    end
  end

  def post(options = {})
    @facebook.feed!(
      message: options[:message],
      picture: options[:picture],
      link: options[:link],
      name: options[:name],
      description: 'Where I post things that I find awesome.'
    )
  end
end
