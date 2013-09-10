App.controller 'NewContactCtrl', ($scope, Contact, dialog) ->
  $scope.save = ->
    Contact.save $scope.contact,  ((res) ->
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
