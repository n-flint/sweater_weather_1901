class UserFacade
  attr_reader :id, :api_key

  def initialize(user)
    @id = 1
    @user = user
    @api_key = user[:api_key]
  end



end