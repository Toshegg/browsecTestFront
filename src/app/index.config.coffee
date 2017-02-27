(->
  config = ($logProvider, $httpProvider) ->
    'ngInject'

    $httpProvider.defaults.headers.common["Accept"] = 'application/json'

  angular
    .module 'browsecTest'
    .config config
    .constant 'SETTINGS', {api_url: 'http://localhost:3000'}
)()
