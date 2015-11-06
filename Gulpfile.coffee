gulp = require 'gulp'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
browserify = require 'browserify'
sourcemaps = require 'gulp-sourcemaps'
coffee = require 'gulp-coffee'
deamdify = require 'deamdify'


# babel = require 'gulp-babel'
concat = require 'gulp-concat'


gulp.task 'js', ->
	browserify 'src/coffee'


gulp.task 'default', ->
  
	gulp.src('src/**/*.coffee')
		.pipe(sourcemaps.init())
		.pipe(coffee({bare: true}).on('error', gutil.log))
		.pipe(concat('app.js'))
		.pipe(sourcemaps.write('.'))
		.pipe gulp.dest('dist/')

