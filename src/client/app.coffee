'use strict'

angular.module 'vs-maintenance', [
  'ndx'
  'ui.router'
]
.config ($locationProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode true
try
  angular.module 'ndx'
catch e
  angular.module 'ndx', [] #ndx module stub