/**
 * Created by mapbar_front on 2019-08-26.
 */
const path = require('path');
const HTMLWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: {
        index: './src/index.js',
    },
    plugins: [
        new HTMLWebpackPlugin({
            title: 'Code Splitting',
            template: 'static/index.html'
        })
    ],
    output: {
        filename: '[name].[hash].bundle.js', // filename对应的是入口文件
        chunkFilename: '[name].bundle.js', // 对应的是异步代码分割的文件
        path: path.resolve(__dirname, 'dist')
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ["env", "stage-0"]
                    }
                }
            }
        ]
    }
};
