(->
  config = ($stateProvider, $urlRouterProvider) ->
    'ngInject'

    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/tasks/index.template.html'
        controller: 'TasksIndexCtrl'
        controllerAs: 'vm'

    $urlRouterProvider.otherwise '/'

  angular
    .module 'browsecTest'
    .config config
)()
