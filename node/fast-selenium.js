var http = require('http');
var agent = new http.Agent({
  keepAlive: true,
  keepAliveMsecs: 30*1000
});
var httpRequest = http.request;
http.request = function(options, callback){
  options["agent"] = agent;
  return httpRequest(options, callback);
}
