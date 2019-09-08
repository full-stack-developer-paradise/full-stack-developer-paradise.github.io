---
layout: post 
title:  "restArguments函数" 
categories: JavaScript 前端  
tags: restArguments rest 
author: 李武帝 
---

* content
{:toc}

# 主题：Underscore.js之restArguments函数

### rest参数

是ES6的一种语法，可以使用rest接受函数的剩余参数，并且以数组的方式呈现。

```javascript
function func(a, ...rest) {
    console.log(a);
    console.log(rest);
}
func(1);// 1, []
func(1, 2); // 1, [2]
func(1, 2, 3); // 1, [2, 3]
```



### restArguments函数

restArguments是underscore.js中的一个核心函数。

这个函数能让我们享受类似ES6的rest参数的作用。

函数实现：

```javascript
function restArguments(func) {
    let startIndex = func.length - 1; // 表示位于最后一个参数就是接受rest数组；
    return function () {
        let length = arguments.length - startIndex;
        if (length < 0) {
            length = 0;
        }
        // 0个参数，legnth = 1；
        let rest = [];
        for (let i = 0; i < length; i++) {
            rest[i] = arguments[startIndex + i];
        }
        switch (startIndex) {
            case 0: return func.call(this, rest);
            case 1: return func.call(this, arguments[0], rest);
            case 2: return func.call(this, arguments[0], arguments[1], rest);
            case 3: return func.call(this, arguments[0], arguments[1], arguments[2], rest);
        }
        var args = [];
        for (let j = 0; j < startIndex; j++) {
            args[j] = arguments[j]
        }
        args[startIndex] = rest
        func.call(this, args)
    }
}
```


在你的函数中，如果你的参数超过4个，那么我们使用一个数组，进行参数的保存传递。
