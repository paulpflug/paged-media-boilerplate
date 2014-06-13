# Generated on 2014-03-03 using generator-angular 0.7.1
"use strict"
path = require "path"
util = require "util"

module.exports = (grunt) ->
  
  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt
    # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt
  process.env.dirname = __dirname
  # Define the configuration for all the tasks
  grunt.initConfig
    
    # Project settings
    yeoman:
      
      # configurable paths
      livereload: 35729

    # Watches files for changes and runs tasks based on the changed files
    watch:
      options:
        livereload: "<%= yeoman.livereload %>"
      coffee:
        files: ["docs/**/*.coffee"]
        tasks: ["newer:coffee","prince"]
      jade:
        files: ["docs/**/*.jade"]
        tasks: ["newer:jade","prince"]
      stylus:
        files: ["docs/**/*.styl"]
        tasks: ["newer:stylus","prince"]
      gruntfile:
        files: ["Gruntfile.coffee"]
        tasks: [
          "express:dev:stop"
          "default"
        ]
        options:
          spawn: false
      express:
        tasks: [
          "express:dev"
        ]
        files: [
          "resources/**/*"
          "server/**/*"
        ]
        options:
          spawn: false
          atBegin: true
    coffee:
      compile:
        files: [
          expand: true,
          cwd: "docs/",
          src: "**/*.coffee",
          ext: ".js",
          dest: "docs_compiled/"          
        ]
    jade: 
      options:
        basedir: "<%= yeoman.app %>"
        pretty: true
        data: (dest,src) ->
          json = src[0].replace(/.jade/i,".json")
          if grunt.file.exists(json)
            console.log "found "+json
            return grunt.file.readJSON(json)
          else
            return false
      compile: 
        files: [
          expand: true,
          cwd: "docs/",
          src: ["index.jade"],
          ext: ".html",
          dest: "docs_compiled/"          
        ]
    stylus:
      compile:
        files: [
          expand: true,
          cwd: "docs/",
          src: "**/*.styl",
          ext: ".css",
          dest: "docs_compiled/"          
        ] 

    # The actual grunt server settings
    express:
      options:
        port: process.env.PORT or 9000
        opts: ["node_modules/coffee-script/bin/coffee"]
      dev:
        options:
          debug: true
          script: "server/server.coffee"

    
    # Empties folders to start fresh
    clean:
      compile:
        files: [
          dot: true
          src: [
            "docs_compiled/*"
          ]
        ]

    prince:
      compile:
        files: 
          "./compiled.pdf": ["docs_compiled/index.html"]
        
     
    # Run some tasks in parallel to speed up the build process
    concurrent:
      compile:
        tasks: ["jade","stylus","coffee"]

  grunt.registerTask "default", [
    "clean:compile"
    "concurrent"
    "prince"
    "watch"
  ]