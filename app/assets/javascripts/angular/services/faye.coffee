App.factory 'Faye', ['$faye', ($faye) ->
  $faye("http://localhost:9292/faye") # set faye url in one place
]