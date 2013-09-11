window.App = angular.module('FavMeApp', ['ngResource', 'ui.bootstrap'])

window.App.config ($routeProvider, $httpProvider) ->
  $httpProvider.defaults.headers.common["X-CSRF-Token"] = $("meta[name=csrf-token]").attr("content")