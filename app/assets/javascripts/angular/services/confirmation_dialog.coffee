App.factory 'modalDialog', ['$window', ($window) ->
  confirm: (message) ->
    $window.confirm message
]
