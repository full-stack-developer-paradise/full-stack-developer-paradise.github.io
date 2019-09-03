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
            },
            inject: 'head'
        }),
        new HTMLWebpackPlugin({
            title: 'Code Splitting',
            filename: 'login.html',// 默认就是index.html
            chunks: ['index', 'another'],
            template: 'static/login.html',// webpack会自动给一个html
        })
    ],
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'dist')
    }
};
