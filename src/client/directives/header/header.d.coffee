'use strict'

angular.module 'vs-maintenance'
.directive 'header', ->
  restrict: 'EA'
  templateUrl: 'directives/header/header.html'
  replace: true
  link: (scope, elem, attrs) ->
    console.log 'header directive'