atom_feed do |feed|
  feed.title 'Single Malt'
  feed.updated(@things.first.created_at) if @things.present?
  feed.link root_url
  feed.description 'A list of awesome things'

  @things.each do |thing|
    feed.entry(thing) do |entry|
      entry.link thing_url(thing)
      entry.title thing.name
      entry.pubDate thing.created_at
      entry.content "<img src='#{thing.image_url}'  />", type: 'html'
    end
  end
end
