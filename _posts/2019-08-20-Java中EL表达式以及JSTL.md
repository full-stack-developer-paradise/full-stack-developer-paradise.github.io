---
layout: post 
title:  "El表达式和JSTL使用总结" 
categories: Java 
tags: el jsp JSTL 
author: 李武帝 
---

* content
{:toc}

# 第一部分、El表达式

## EL表达式是什么

Expression Language，表达式语言，用于简化JSP的输出。



## 基本语法

```
${表达式}
```
示例：

```html
<h1>${stu.name}</h1>
```
## 四大作用域对象

EL表达式，内置四大作用域对象。

* pageScope，表示从当前页取值。
* requestScope，表示从请求中取值。
* sesstionScope，表示从当前会话中获取属性值。
* applicationScope，表示从当前应用获取全局属性值。

## EL表达式的输出

```
${[作用域.]属性名[.子属性]}
```
EL表达式将运算结果进行输出。

EL表达式可以输出大多数对象，本质上是调用对象的toString方法。

```
${title}

${requestScope.name}

${age + 20}

${ 1 < 3 && 2 > 5}
```
## EL输出参数值

内置param参数值。

```
${param.title}
```
# 第二部分、JSTL

## JSTL是什么

JSTL（JSP Standard Tag Library），JSP标准标签库。

为了简化JSP开发而出现的技术。

## 使用JSTL需要引入两个jar包。

* taglibs-standard-impl-1.2.5.jar

* taglibs-standard-spec-1.2.5.jar

## 基本使用

在jsp顶部添加两行文件

```
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190820235632381.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L21hcGJhcl9mcm9udA==,size_16,color_FFFFFF,t_70)

代码中使用：

#### 1，判断标签

第一种：
```
<c:if>	单分支判断
```
第二种

```
<c:choose>、<c:when>、<c:otherwise>	多分支判断
```
使用实例：
```
<c:if test="${true}">
 123
</c:if>
<c:choose>
    <c:when test="${(requestScope.x > 0) && (requestScope.x <= 10)}">
        <h2>1-10之间的整数</h2>
    </c:when>
    <c:when test="${requestScope.x > 10 && requestScope.x <= 20}">
        <h2>1-10之间的整数</h2>
    </c:when>
    <c:otherwise>
        <h2>随缘啦！</h2>
    </c:otherwise>
</c:choose>
```
#### 2，集合遍历

```
<c:forEach>		集合遍历
```
使用实例：

```
<c:forEach var="set" varStatus="idx" items="${requestScope.sets}">
    <h1>${idx.index + 1}----${set}</h1>
</c:forEach>
```
#### 3，日期时间格式化
语法：

```
<fmt:formatDate>	格式化日期
```

示例：
```
<fmt:formatDate value="${requestScope.now}" pattern="yyyy年MM月dd日 HH时mm分ss秒"></fmt:formatDate>
```
#### 4，数字格式化
语法
```
<fmt:formatNumber>		格式化数字
```
示例：
```
<fmt:formatNumber value="${requestScope.amt}" pattern="0,000.00"></fmt:formatNumber>
```


