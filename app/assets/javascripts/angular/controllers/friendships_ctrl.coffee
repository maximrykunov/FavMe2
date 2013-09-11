App.controller 'FriendshipsCtrl', ['$scope', '$dialog', 'Friendship', 'modalDialog', ($scope, $dialog, Friendship, modalDialog) ->
  $scope.message = 'test'
  $scope.friendships = Friendship.query()

  $scope.current_tab = 'pending'

  # dialogOptions =
  #   templateUrl: "/assets/Friendships/edit.html"

  # $scope.showFriendship = (Friendship) ->
  #   $scope.selectedFriendship = Friendship

  # $scope.editFriendship = (Friendship) ->
  #   # $scope.selectedFriendship = {Friendship}
  #   FriendshipToEdit = Friendship
  #   $dialog.dialog(angular.extend(dialogOptions,
  #     controller: "EditFriendshipCtrl"
  #     resolve:
  #       Friendship: ->
  #         angular.copy FriendshipToEdit
  #   )).open().then (result) ->
  #     angular.copy result, FriendshipToEdit  if result

  # $scope.newFriendship = () ->
  #   FriendshipToEdit = undefined
  #   $dialog.dialog(angular.extend(dialogOptions,
  #     controller: "NewFriendshipCtrl"
  #   )).open().then (result) ->
  #     $scope.Friendships = Friendship.query()  if result

  $scope.confirmFriendship = (Friendship) ->
    temp_obj = angular.copy Friendship
    temp_obj.state = 'confirm'
    temp_obj.$update ->
      Friendship.state = 'active'
      temp_obj = undefined
      # $scope.message = Friendship.id

  $scope.deleteFriendship = (Friendship, confirmation_text) ->
    if modalDialog.confirm(confirmation_text)
      Friendship.$delete ->
        $scope.friendships.splice $scope.friendships.indexOf(Friendship), 1
]

