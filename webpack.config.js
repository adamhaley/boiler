var webpack = require('webpack');

module.exports = {
	context: __dirname + '/src',
	entry: './components/Main.js',
	output: {
		path: __dirname + '/src',
		filename: 'bundle.js'
	},
	module: {
		loaders: [
			{
				test: /\.jsx?$/, 
				loader: 'babel', 
				exclude: /node_modules/, 
				query: {
					presets:['react','es2015']
				}
			},
			{test: /\.css$/, loader: 'style!css', exclude: /node_modules/},
			{test: /\.styl$/, loader: 'style!css!stylus', exclude: /node_modules/},
		]
	},
	plugins: [
		new webpack.DefinePlugin({
			ON_TEST: process.env.NODE_ENV === 'test'
		})
	],
}
