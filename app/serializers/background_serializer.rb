class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :background_image
end