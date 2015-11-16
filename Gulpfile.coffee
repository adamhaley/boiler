gulp = require 'gulp' 
browserSync = require 'browser-sync'
reload = browserSync.reload

rjs = require 'gulp-requirejs'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
del = require 'del'
watch = require 'gulp-watch'
# deamdify = require 'deamdify'
# browserify = require 'browserify'
sourcemaps = require 'gulp-sourcemaps'
coffee = require 'gulp-coffee'

# babel = require 'gulp-babel'
concat = require 'gulp-concat'

gulp.task 'clean', ->
	del ['dist/*']


gulp.task 'rjs',  ['clean'], ->

	shim = 
		include: [ 'main' ]
		mainConfigFile: 'main.js'
		out: '../build-main.js'
		jquery: '../library/js/libs/jquery-min'
		underscore: '../library/js/libs/underscore-min'
		backbone: '../library/js/libs/backbone-min'
		text: '../library/js/libs/text'
		famous: '../library/js/libs/famous/src'
		platform: '../library/js'
		platformLib: '../library/js/main-dev'
		platformTemplate: '../library'
		templates: '../templates'
		staticPath: './'	

	rjs(
		baseUrl: 'src/library/platform.js'
		out: 'platform.min.js'
		shim: shim
	).pipe gulp.dest('./dist/')
	# pipe it to the output DIR 
	return


gulp.task 'compile-js', ['clean'], ->

	gulp.src('src/**/*.coffee')
		.pipe(sourcemaps.init())
		.pipe(coffee({bare: true}).on('error', gutil.log))
		.pipe(concat('main.js'))
		.pipe(sourcemaps.write('.'))
		.pipe(gulp.dest('dist/'))

gulp.task 'serve', ['rjs','compile-js'], ->

  browserSync server: baseDir: 'dist'
 

gulp.task 'default', ['clean','rjs','compile-js','serve']
  
	

