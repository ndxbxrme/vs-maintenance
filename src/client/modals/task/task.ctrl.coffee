'use strict'

angular.module 'vs-maintenance'
.controller 'TaskCtrl', ($scope, $rootScope, ndxModalInstance, data) ->
  $scope.task = data
  $scope.setDate = ->
    $rootScope.$emit 'swiper:show', $scope.task.date
  deref = $rootScope.$on 'set-date', (e, date) ->
    $scope.task.date = date
  $scope.$on '$destroy', ->
    deref()
  $scope.cancel = ->
    ndxModalInstance.dismiss()