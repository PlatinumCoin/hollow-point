gulp = require 'gulp'
clean = require 'gulp-clean'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'

source = 'public/*.coffee'
destination = 'public/dist'

gulp.task 'clean', () ->
	gulp.src destination
		.pipe clean()

gulp.task 'coffee-lint', () ->
	gulp.src source
		.pipe coffeelint()
		.pipe coffeelint.reporter()

gulp.task 'coffee-build', () ->
	gulp.src source
		.pipe coffee(sourceMap: true)
		.pipe gulp.dest destination

gulp.task 'coffee', ['coffee-lint', 'coffee-build']

gulp.task 'default', ['coffee'], () ->
	gulp.watch source, ['coffee']