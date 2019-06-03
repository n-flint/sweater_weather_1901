class Background
  attr_reader :id, :owner, :secret, :server, :farm, :title

  def initialize(photo_data)
    @id = photo_data['id']
    @owner = photo_data['owner']
    @secret = photo_data['secret']
    @server = photo_data['server']
    @farm = photo_data['farm']
    @title = photo_data['title']
  end


end