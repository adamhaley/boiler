var webpack = require('webpack');

module.exports = {
	context: __dirname + '/src',
	entry: './index.js',
	output: {
		path: __dirname + '/src',
		filename: 'bundle.js'
	},
	plugins: [
		new webpack.DefinePlugin({
			ON_TEST: process.env.NODE_ENV === 'test'
		})
	],
}
