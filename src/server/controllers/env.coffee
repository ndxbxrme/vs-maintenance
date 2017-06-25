'use strict'

module.exports = (ndx) ->
  ndx.app.get '/env.js', (req, res, next) ->
    console.log "#{req.protocol}://#{req.headers.host}"
    console.log req.headers.host
    res.header 'Content-Type', 'application/javascript'
    res.end "
(function() {
  'use strict';
  var e, error, module;

  module = null;

  try {
    module = angular.module('ndx');
  } catch (error) {
    e = error;
    module = angular.module('ndx', []);
  }
  module.constant('env', {
    PROPERTY_URL: '#{process.env.PROPERTY_URL}',
    PROPERTY_TOKEN: '#{process.env.PROPERTY_TOKEN}'
  });
}).call(this);
    "