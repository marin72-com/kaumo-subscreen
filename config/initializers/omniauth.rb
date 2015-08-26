Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    ENV["TWITTER_CONSUMER_KEY"],
    ENV["TWITTER_CONSUMER_SECRET"]

  if Rails.env.development?
    provider :facebook,
      ENV["FACEBOOK_CONSUMER_KEY"],
      ENV["FACEBOOK_CONSUMER_SECRET"]
  else 
    provider :facebook,
      ENV["FACEBOOK_CONSUMER_KEY"],
      ENV["FACEBOOK_CONSUMER_SECRET"]
  end
end
