gulp = require 'gulp'
sourcemaps = require 'gulp-sourcemaps'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
# babel = require 'gulp-babel'
concat = require 'gulp-concat'



gulp.task 'default', ->
  
	gulp.src('src/**/*.coffee')
		.pipe(sourcemaps.init())
		.pipe(coffee({bare: true}).on('error', gutil.log))
		.pipe(concat('app.js'))
		.pipe(sourcemaps.write('.'))
		.pipe gulp.dest('dist/')

