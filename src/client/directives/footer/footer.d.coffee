'use strict'

angular.module 'vs-maintenance'
.directive 'footer', ->
  restrict: 'EA'
  templateUrl: 'directives/footer/footer.html'
  replace: true
  link: (scope, elem, attrs) ->
    console.log 'footer directive'