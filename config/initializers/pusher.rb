# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '677457'
Pusher.key = '6aee5f74dc01b3467fea'
Pusher.secret = '70f1ec2d7003e7bf0607'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true