/**
 * Created by mapbar_front on 2019-08-26.
 */
const path = require('path');
const HTMLWebpackPlugin = require('html-webpack-plugin');
const webpack = require('webpack');

module.exports = {
    mode: "production",
    entry: {
        index: './src/index.js',
        another: './src/other.js'
    },
    plugins: [
        new HTMLWebpackPlugin({
            title: 'Code Splitting',
            filename: 'index.html',// 默认就是index.html
            template: 'static/index.html',// webpack会自动给一个html
            minify: {
                removeComments: true,
                collapseWhitespace: true,
                removeAttributeQuotes: true
            }
        }),
        // new webpack.optimize.CommonsChunkPlugin({
        //     name: 'common'
        // })
    ],
    optimization: {
        splitChunks: {
            cacheGroups: {
                commonjs: {
                    chunks: 'initial',
                    minChunks: 2,
                    maxInitialRequests: 5,
                    minSize: 0
                },
                vendor: {
                    test: /node_modules/,
                    chunks: 'initial',
                    name: 'vendor',
                    priority: 10,
                    enforce: true
                }
            }
        },
        runtimeChunk: true
    },
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'dist')
    }
};
