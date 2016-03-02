run lambda { |env|
  [
    301,
    {'Content-Type' => 'text','Location' => 'https://devcenter.heroku.com/articles/support-channels#discussion-forum'},
    ['301 Moved Permanently']
  ]
}
