gulp = require 'gulp' 
browserSync = require 'browser-sync'
reload = browserSync.reload

rjs = require('gulp-rjs')
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
del = require 'del'
# deamdify = require 'deamdify'
# browserify = require 'browserify'
sourcemaps = require 'gulp-sourcemaps'
coffee = require 'gulp-coffee'

# babel = require 'gulp-babel'
concat = require 'gulp-concat'

gulp.task 'clean', ->
	del ['dist/*']

gulp.task 'rjs', ['clean'], ->

	gulp.src('src/library/**/*.js')
		
		.pipe rjs(baseUrl: './src/library')
		.pipe gulp.dest('./dist/library')


gulp.task 'compile-js', ['clean'], ->
	gulp.src('src/**/*.coffee')
		.pipe(sourcemaps.init())
		.pipe(coffee({bare: true}).on('error', gutil.log))
		.pipe(concat('main.js'))
		.pipe(sourcemaps.write('.'))
		.pipe(gulp.dest('dist/'))

gulp.task 'serve', ['rjs','compile-js'], ->
  browserSync server: baseDir: 'dist'
  gulp.watch [
    '*.html'
    'dist/**/*.css'
    'dist/**/*.js'
  ], { cwd: 'dist' }, reload

gulp.task 'default', ['clean','rjs','compile-js','serve']
  
	

