'use strict'

angular.module 'vs-maintenance'
.directive 'callendar', ->
  restrict: 'EA'
  templateUrl: 'directives/callendar/callendar.html'
  replace: true
  link: (scope, elem, attrs) ->
    getTasks = (date, time) ->
      date = new Date date.getFullYear(), date.getMonth(), date.getDate(), 9
      taskDate = new Date date.getFullYear(), date.getMonth(), date.getDate(), time
      [{
        title: 'dgoijd godijg dsoigjds gjsdiogj dsojg sdoigj sdoigjsdoi gjodsigj sdiojgosdij gosdijg osdigj oijg osdijg osdigj ij g'
        top: (taskDate.valueOf() - date.valueOf()) / 3600000 * 3
        height: 3600000 / 3600000 * (1.5 * Math.floor(Math.random() * 6) + 3)
      }]
    scope.days = []
    startDate = new Date()
    while startDate.getDay() isnt 1
      startDate = new Date(startDate.valueOf() - 24 * 60 * 60 * 1000)
    i = 0
    while i++ < 5
      hours = []
      startDate = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate(), 9)
      j = 0
      while j++ < 12
        hours.push startDate
        startDate = new Date(startDate.valueOf() + 60 * 60 * 1000)
      scope.days.push 
        day: startDate
        tasks: getTasks startDate, i + 9
        hours: hours
      startDate = new Date(startDate.valueOf() + 24 * 60 * 60 * 1000)
    scope.openTask = (task, ev) ->
      console.log task.date.getHours()
      scope.modal
        template: 'task'
        controller: 'TaskCtrl'
        data: task
      .then (result) ->
        true
      , (err) ->
        false
      ev.stopPropagation()