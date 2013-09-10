# App.controller 'ContactsCtrl', ['$scope', '$dialog', 'Contact', 'Faye', ($scope, $dialog, Contact, Faye) ->
App.controller 'ContactsCtrl', ['$scope', '$dialog', 'Contact', 'modalDialog', ($scope, $dialog, Contact, modalDialog) ->
  $scope.contacts = Contact.query()
  $scope.message = 'test2'
  $scope.contact_search_filter = ''
  $scope.contact_provider_filter = ''

  $scope.data = []
  # Faye.subscribe "/messages", (msg) ->
  #   $scope.data.push msg

  $scope.contact_search = (contact) ->
    s_filter = $scope.contact_search_filter.toLowerCase()
    if (contact.name.toLowerCase().indexOf(s_filter) isnt -1 or
        contact.email.toLowerCase().indexOf(s_filter) isnt -1  or
        contact.phone.toLowerCase().indexOf(s_filter) isnt -1) and
        contact.provider.indexOf($scope.contact_provider_filter) isnt -1
      true
    else
      false

  dialogOptions =
    templateUrl: "/assets/contacts/edit.html"

  $scope.showContact = (contact) ->
    $scope.selectedContact = contact

  $scope.editContact = (contact) ->
    # $scope.selectedContact = {contact}
    contactToEdit = contact
    $dialog.dialog(angular.extend(dialogOptions,
      controller: "EditContactCtrl"
      resolve:
        contact: ->
          angular.copy contactToEdit
    )).open().then (result) ->
      angular.copy result, contactToEdit  if result

  $scope.newContact = () ->
    contactToEdit = undefined
    $dialog.dialog(angular.extend(dialogOptions,
      controller: "NewContactCtrl"
    )).open().then (result) ->
      $scope.contacts = Contact.query()  if result

  $scope.deleteContact = (contact, confirmation_text) ->
    if modalDialog.confirm(confirmation_text)
      contact.$delete ->
        $scope.contacts.splice $scope.contacts.indexOf(contact), 1
]

