class BackgroundFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
  end 

  def background_image
      response = Faraday.get('https://api.flickr.com/services/rest/') do |f|
        f.params['api_key'] = ENV['FLICKR_KEY']
        f.params['method'] = 'flickr.photos.search'
        f.params['tags'] = 'denver,co,skyline,weather'
        f.params['text'] = 'denver,co'
        f.params['nojsoncallback'] = 1
        # f.params['text'] = 'denver, co'
        f.params['format'] = 'json'
      end
      flickr_data = JSON.parse(response.body)
      photo_data = flickr_data['photos']['photo'][0]
      background(photo_data)
  end

  def background(photo_data)
    Background.new(photo_data).url
  end
end