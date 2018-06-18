require 'forbidden_error'

JSONAPI.configure do |config|
  config.exception_class_whitelist = [ForbiddenError]
end
