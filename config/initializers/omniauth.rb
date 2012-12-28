OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, '535046323187297', '07189d7a8d19617b630c6bd61b8f339f'
  provider :twitter, '8900N8yA502wuFtlxAevVA', 'ZEytQJj893aNYPcKLie6su4hATsafOgBpRMMlc8jVug'  
end