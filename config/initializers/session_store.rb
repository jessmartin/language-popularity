# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_clojure_popularity_session',
  :secret => 'c9222c466566a8528a1fa7237298cae1095912bc6d0b63c00e01998a8e1394990623271c76e21e4e70c113191554985a1c270eb76428e4a08d58b1ae55170a0b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
