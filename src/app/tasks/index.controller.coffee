(->
  class TasksIndexCtrl
    constructor: (@$scope, @$state, @$stateParams, @TasksResource) ->
      @new_task = {}

      @TasksResource.index().$promise.then (tasks) =>
        @tasks = tasks

    create: () ->
      @TasksResource.create(@new_task).$promise.then (task) =>
        @tasks.push(task)
        @new_task = {}

    removeTask: (task) ->
      @TasksResource.destroy({id: task.id}).$promise.then () =>
        @tasks.splice(@tasks.indexOf(task), 1)

    toggleCompleted: (task) ->
      @TasksResource.update({id: task.id, completed: task.completed})

    toggleEditting: (task) ->
      task.editting = true
      task.previous_title = task.title

    updateTask: (task) ->
      @TasksResource.update({id: task.id, title: task.title}).$promise.then () =>
        task.editting = false
        delete task.previous_title

    cancelEditting: (task) ->
      task.editting = false
      task.title = task.previous_title
      delete task.previous_title

    moveTask: (index) ->
      @tasks.splice(index, 1)

      @tasks.forEach (task, index) =>
        @TasksResource.update({id: task.id, weight: index})

  TasksIndexCtrl.$inject = ['$scope', '$state', '$stateParams', 'TasksResource']

  angular
    .module 'browsecTest'
    .controller 'TasksIndexCtrl', TasksIndexCtrl
)()
