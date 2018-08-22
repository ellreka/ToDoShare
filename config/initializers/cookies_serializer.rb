# Be sure to restart your server when you modify this file.
Rails.application.config.session_store :cookie_store, key: '_appname_session', expire_after: 20.years
# Specify a serializer for the signed and encrypted cookie jars.
# Valid options are :json, :marshal, and :hybrid.
Rails.application.config.action_dispatch.cookies_serializer = :json
