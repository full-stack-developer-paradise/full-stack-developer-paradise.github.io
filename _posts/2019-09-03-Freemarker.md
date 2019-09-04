---
layout: post 
title:  "FreeMarker使用" 
categories: 前端 
tags: FreeMarker 
author: 李武帝 
---

* content
{:toc}

# 主题：FreeMarker使用

### 基本使用

说明

1、JSP是官方标准的模板引擎。使用EL表达式+JSTL进行开发。

2、FreeMarker是比JSP更简洁的模板引擎。

3、使用的时候，要配置freemarker的jar包。

核心代码如下：

```
Configuration config = new Configuration(Configuration.VERSION_2_3_29);

Template template = config.getTemplate("sample.ftl");

Map<String, Object> data = new HashMap<String, Object>();

template.process(data, new OutputStreamWriter(System.out));
```



基本使用：

```jsp
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;

public class Main {

    public static void main(String[] args) throws IOException, TemplateException {
        System.out.println("Hello World!");
        // 1,加载模板
        // 创建核心对象
        Configuration config = new Configuration(Configuration.VERSION_2_3_29);
        // 设置加载目录
        config.setClassForTemplateLoading(Main.class, "");

        Template template = config.getTemplate("sample.ftl");

        // 2,创建数据
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("site", "百度");
        data.put("url", "www.baidu.com");

        // 3,产生输出
        template.process(data, new OutputStreamWriter(System.out));
    }
}
```
### FTL取值

```
${属性名}     取值

${属性名!默认值}    默认值

${属性名?string}   格式化输出
```
实例：
```
// 时间格式化
${date?string("yyyy年MM月dd日")}

// 数字格式话(保留两位小树)
${number?string("0.00")}

// 一个实例化对象的取值
${computer.sn}

// 一个实例化对象的属性值为Map结构进行取值
${computer.info["cpu"]}
```

### FTL的条件判断

##### <1>基本语法如下：

1、if单个判断
```
<#if 条件>

</#if>
```
2、if多重判断

```
<#if 条件>
    // ......
<#elseif 条件>
    // ......
</#if>
```
3、判断一个对象是否存在使用"??"
```text
<#if 条件??>

<#if>
```
4、switch的基本使用
```text
<#switch 条件>
<#case value1>
    // ......
<#break>
<#case value2>
    // ......
<#break>
<#case value3>
    // ......
<#break>
<#default>
    // ......
</#switch>
```
##### <2>使用实例：

1、if的使用
```
<#if computer.state == 1>
状态：正在使用
<#elseif computer.state == 2>
状态：闲置
<#elseif computer.state == 3>
状态：已废弃
</#if>
```
2、switch的使用
```
<#switch computer.state>
    <#case 1>
        状态：正在使用
        <#break>
    <#case 2>
        状态：闲置
        <#break>
    <#case 3>
        状态：已废弃
        <#break>
    <#default>
        无效状态
</#switch>
```

### list迭代列表和Map

##### <1>list迭代列表

1、基本语法（假如有一个Computer的对象列表）
```
<#list computers as c>
序号：${c_index}
SN：${c.sn}
<#list>
```
##### <2>list迭代map
1、基本语法（假如这个map数据是computers_map）
```
<#list computers_map??keys as k>
${k}-${computers_map[k]}
</#list>
```

##### 使用实例
```
<#--list的使用（迭代列表）-->
<#list computers as c>
    序号：${c_index}
    SN：${c.sn}
    <#switch c.state>
        <#case 1>
        状态：正在使用
            <#break>
        <#case 2>
        状态：闲置
            <#break>
        <#case 3>
        状态：已废弃
            <#break>
        <#default>
        无效状态

    </#switch>
</#list>
<#--list的使用（迭代map）-->
<#list computer_map?keys as key>
    序列号：${key}
    computer的state: ${computer_map[key].state}
</#list>
```

### FreeMarker内建函数

访问网址：http://freemarker.foofun.cn/

lower_case/upper_case：大小写

cap_first：首字母大些

index_of：字符索引

length：字符串长度

round/floor/ceiling：四舍五入/向下取整/向上取整

size：集合的大小

first/last：集合的第一个/最后一个元素

sort_by：集合排序

```text
name:${name?cap_first}
${brand?upper_case}
${brand?length}
${words?replace("blood", "*****")}
${(words?index_of("blood") != -1) ? string("不包含敏感信息", "包含敏感信息")}
${n?round}
${n?floor}
${n?ceiling}
```
### 与Servlet联动使用

ftl是jsp的模板引擎的替代产品，它的使用，需要使用额外的jar包，这个jar包是freemarkder。

而浏览器想解析这个ftl文件，必须使用一个servlet，叫FreeMarkerServlet。

可以在web.xml中这样配置：
```text
    <servlet>
        <servlet-name>freemarker</servlet-name>
        <servlet-class>freemarker.ext.servlet.FreemarkerServlet</servlet-class>
        <init-param>
            <param-name>TemplatePath</param-name>
            <param-value>/WEB-INF/ftl</param-value>
        </init-param>
    </servlet>
    <servlet-mapping>
        <servlet-name>freemarker</servlet-name>
        <url-pattern>*.ftl</url-pattern>
    </servlet-mapping>
```
这个配置的意思就是：遇到任何.ftl后缀的请求，都在/WEB-INF/ftl中找到对应的ftl文件进行解析，并且解析使用的是FreeMarkderServlet。

一个基本的使用实例如下：
```text
package com.wudi.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mapbar_front on 2019/9/4.
 */
@WebServlet("/list")
public class ListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> list = new ArrayList<Employee>();
        list.add(new Employee(1101, "张三", "研发部门", "前端工程师", 30000f));
        list.add(new Employee(1102, "李四", "研发部门", "PHP工程师", 30000f));
        list.add(new Employee(1103, "王五", "研发部门", "运维工程师", 30000f));
        list.add(new Employee(1104, "赵钱", "研发部门", "测试工程师", 30000f));
        list.add(new Employee(1105, "孙李", "研发部门", "JAVA工程师", 30000f));

        request.setAttribute("employee_list", list);
        request.getRequestDispatcher("/employee.ftl").forward(request, response);
    }
}

```
employee.ftl文件如下：
```text
<!DOCTYPE html>
<html>
<head>
    <title>Empolyee</title>
</head>
<body>
    <table>
        <tr>
            <td>员工编号</td>
            <td>员工姓名</td>
            <td>部门</td>
            <td>职位</td>
            <td>薪资</td>
        </tr>
        <#list employee_list as emp>
            <tr>
                <td>${emp.empno}</td>
                <td>${emp.ename}</td>
                <td>${emp.department}</td>
                <td>${emp.job}</td>
                <td>${emp.salary?round}</td>
            </tr>
        </#list>

    </table>
</body>
</html>
```
