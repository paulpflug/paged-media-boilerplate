"use strict"

###
Module dependencies.
###

express = require "express"
http = require "http"
path = require "path"

app = express()
app.set "port", process.env.PORT or 9000
if process.env.dirname
  dir = process.env.dirname
else
  dir = path.join(__dirname,"..")

## setting static routes
app.use "/resources", express.static(path.join(dir, "resources"))
app.use express.static(path.join(dir, "docs_compiled"))
app.use "/vendor", express.static(path.join(dir, "vendor"))
## starting server
server = app.listen app.get("port"), ->
  console.log "Express server listening on port %d in %s mode", app.get("port"), app.get("env")
server.on "close", () -> console.log "closing Express server"