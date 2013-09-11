App.factory 'Friendship', ['$resource', ($resource) ->
  $resource '/friendships/:id',
    id: "@id"
  ,
    update:
      method: "PUT"
]