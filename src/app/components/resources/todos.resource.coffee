(->
  class TasksResource
    constructor: (@$resource, SETTINGS) ->
      return @$resource SETTINGS.api_url + '/:id', { id: '@id'  },
          index:
            method:  'GET'
            isArray: true
            responseType: 'json'
            transformResponse: (data, headersGetter) ->
              if (typeof data == 'string')
                data = JSON.parse(data)
              data

          show:
            method:  'GET'
            isArray: false
            responseType: 'json'
            transformResponse: (data, headersGetter) ->
              if (typeof data == 'string')
                data = JSON.parse(data)
              data

          create:
            method: 'POST'
            isArray: false
            responseType: 'json'
            transformResponse: (data, headersGetter) ->
              if (typeof data == 'string')
                data = JSON.parse(data)
              data

          update:
            method: 'PUT'
            isArray: false
            responseType: 'json'
            transformResponse: (data, headersGetter) ->
              if (typeof data == 'string')
                data = JSON.parse(data)
              data

          destroy:
            method:  'DELETE'
            isArray: false
            responseType: 'json'
            transformResponse: (data, headersGetter) ->
              if (typeof data == 'string')
                data = JSON.parse(data)
              data

  TasksResource.$inject = ['$resource', 'SETTINGS']

  angular
    .module('browsecTest')
    .factory('TasksResource', TasksResource)
)()
