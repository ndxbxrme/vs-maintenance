'use strict'

angular.module 'vs-maintenance', [
  'ndx'
  'ui.router'
  'ui.gravatar'
  'date-swiper'
]
.config ($locationProvider, $urlRouterProvider, gravatarServiceProvider) ->
  gravatarServiceProvider.defaults =
    size: 16
    "default": 'mm'
    rating: 'pg'
  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode true
.run ($rootScope, ndxModal) ->
  root = Object.getPrototypeOf $rootScope
  root.generateId = (len) ->
    letters = "abcdefghijklmnopqrstuvwxyz0123456789"
    output = ''
    i = 0
    while i++ < len
      output += letters[Math.floor(Math.random() * letters.length)]
    output
  root.modal = (args) ->
    size = args.size or 'large'
    controller = args.controller or 'YesNoCancelCtrl'
    backdrop = args.backdrop or 'static'
    modalInstance = ndxModal.open
      templateUrl: "modals/#{args.template}/#{args.template}.html"
      windowClass: size
      controller: controller
      backdrop: backdrop
      resolve:
        data: ->
          args.data
    modalInstance.result
try
  angular.module 'ndx'
catch e
  angular.module 'ndx', [] #ndx module stub