---
layout: post 
title:  "Cookie、Sesstion和本地缓存" 
categories: Java 
tags: Cookie Sesstion localStorage SesstionStorage  
author: 李武帝 
---

* content
{:toc}

## 基本概念

1. cookie，是在客户端（浏览器）存储少量数据的地方，通常用于存储用户数据。在客户端和服务端进行交互的时候，会携带cookie到服务器。默认情况下，退出浏览器，cookie会被清除，但是cookie你可以给设置一个过期时间，在这个时间之前，cookie都不会被清除。
2. sesstion，是在服务端存储数据，保持用户会话的一种技术，通常用于客户端和服务端的通信。sesstion会在客户端的cookie中，存储一个sesstionid，每次发送请求的时候，会把这个sesstionid携带过去。在没有用户操作的情况下，sesstion会默认存储30分钟的数据，过期之后，需要重新获取sesstion。
3. localstorage，一种纯前端的存储数据的方式，存储数据量远远大于cookie。localstorage中的数据存储，和服务端完全没有任何关系。localstorage没有过期时间，只能手动调用相关API进行清除。
4. sesstionstorage，也是一种纯前端的数据存储方式，不过这个sesstionstorage，仅仅是在浏览器打开的状态下的临时数据存储，当浏览器刷新，关闭时，存储的数据会丢失。



## cookie详解

正常情况下，cookie的使用场景是，保存用户的登陆信息。

在一个网页登陆的时候，调用登陆接口，服务端在返回数据的时候，会忘cookie中写入用户信息。以后的每次接口请求，都会自动携带这个cookie信息。

在前端，使用js也能获取当前域名下的cookie信息，获取到的cookie是一个字符串，基本语法是：

```javascript
let cookie = document.cookie;
```
### 1、服务端写入cookie
我们服务端的核心代码如下：

```
Cookie cookie = new Cookie("user", "admin");
response.addCookie(cookie);
```
cookie是在服务端实例化一个Cookie类得到的。在响应中response.addCookie()方法进行添加cookie。

一个完整的servlet实例如下：

```
package com.ipackage.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by mapbar_front on 2019/8/1.
 */
@WebServlet("/cookie")
public class CookiesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("用户登陆成功");
        Cookie cookie = new Cookie("user", "admin");
        response.addCookie(cookie);
        response.getWriter().println("login sucess");
    }
}
```

### 2、客户端查看cookie

在浏览器中访问http://localhost:8080/cookie，就可以看到相应的请求信息。

![在这里插入图片描述](https://img-blog.csdnimg.cn/2019082000143935.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21hcGJhcl9mcm9udA==,size_16,color_FFFFFF,t_70)

显而易见，cookie是存储在客户端的。

### 3、前端JS获取cookie

```
console.log(document.cookie);
// "user=admin"
```
浏览器能够获取当前的cookie，证明我们的cookie其实是一种不安全的交互方式。基于这种保存用户信息的缺陷，出现了sesstion用户会话技术。

## sesstion详解

正常情况下，打开一个浏览器窗口，向服务端请求资源，服务端就会生成一个对应于当前浏览器的唯一的sesstionId，这个sesstionId会存储在客户端的cookie中，每次请求，把这个sesstionId携带到服务端，服务端就能判断当前浏览器对应哪一个用户了。

这里要切记，每次打开新的浏览器窗口，都会生成新的sesstionId，浏览器窗口和sesstion一一对应，这是保证用户数据安全的核心部分。

### 1，服务端生成sesstion。
核心代码：

```
HttpSession session = request.getSession();
session.setAttribute("name", "张三");
String sesstionId = session.getId();
```
生成sesstionId的一个示例：

```
package com.imooc.servlet.session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by mapbar_front on 2019/8/1.
 */
@WebServlet("/sesstion/login")
public class SesstionLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("name", "张三");
        String sesstionId = session.getId();
        System.out.println(sesstionId);
        request.getRequestDispatcher("/sesstion/index").forward(request, response);
    }
}

```
### 2，客户端查看sesstionId
在浏览器输入http://localhost:8080/sesstion/login

得到如下的结果：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190820002617411.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21hcGJhcl9mcm9udA==,size_16,color_FFFFFF,t_70)

## localStorage的使用
不同于cookie和sesstion，localStorage是纯前端的存储数据的方式。

```javascript
localStorage.setItem("user", "mapbar_front");
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190820003225617.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21hcGJhcl9mcm9udA==,size_16,color_FFFFFF,t_70)

执行了上面的语句，你在你的控制台中的Application中看到刚刚设置的LocalStorage。

一般而言，存储的数据，还需要读取，使用的Api如下：

```javascript
localStorage.getItem("user"); // "mapbar_front"
```
localStorage在不清除的情况下，哪怕关闭浏览器，还是会得到信息，是持久存储的。

## sesstionStorage

sesstionStorage和localStorage的基本Api是一样的，唯一的区别就是，localStorage是持久存储的，而它自己是临时存储的，在同一域名下，关闭浏览器，sesstionStorage就会丢失数据。

```javascript
sessionStorage.setItem("user", "mapbar_front");
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190820003858329.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21hcGJhcl9mcm9udA==,size_16,color_FFFFFF,t_70)

获取方式，和localStorage一样。

```javascript
sesstionStorage.getItem("user");
// "mapbar_front"
```

--------------------------------end--------------------------------
