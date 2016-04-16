var webpack = require('webpack');

module.exports = {
	context: __dirname + '/src',
	entry: './index.js',
	output: {
		path: __dirname + '/src',
		filename: 'bundle.js'
	},
	module: {
		loaders: [
			{test: /\.js$/, loader: 'babel', exclude: /node_modules/},
			{test: /\.html$/, loader: 'raw'},
			{test: /\.css$/, loader: 'style!css'},
			{test: /\.styl$/, loader: 'style!css!stylus'},
		]
	},
	plugins: [
		new webpack.DefinePlugin({
			ON_TEST: process.env.NODE_ENV === 'test'
		})
	],
}
