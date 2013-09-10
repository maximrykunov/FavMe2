App.controller 'EditContactCtrl', ($scope, contact, dialog) ->
  $scope.contact = contact

  $scope.save = ->
    contact.$update ((res) ->
      # success
      dialog.close $scope.contact
    ), (res) ->
      # error handler
      if res.status is 400
        $scope.errors = {}
        for field of res.data.errors
          $scope.errors[field] = res.data.errors[field]
          $scope.editContactForm[field].$setValidity(false)

  $scope.close = ->
    dialog.close undefined
