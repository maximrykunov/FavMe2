App.factory 'Contact', ['$resource', ($resource) ->
  $resource '/contacts/:id',
    id: "@id"
  ,
    update:
      method: "PUT"
]