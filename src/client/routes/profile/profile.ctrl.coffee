'use strict'

angular.module 'vs-maintenance'
.controller 'ProfileCtrl', ($scope, auth) ->
  $scope.profile = $scope.single 'users', auth.getUser()._id