module SHOP
  class Api < Grape::API
    version 'v1', using: :path
    content_type :json, 'application/vnd.api+json; charset=UTF-8'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    prefix :api
    mount V1::Base
  end
end
