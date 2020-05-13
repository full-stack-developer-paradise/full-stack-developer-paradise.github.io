# 在IDEA Maven项目中导入本地jar包的步骤



### **1、打开侧面的maven，点击图中箭头指向的图标。**

![img](https://img.jbzj.com/file_images/article/201812/20181212112550574.png?20181112112559)

### **2、出现如下弹窗，在Command line在中输入执行的指令。**

![img](https://img.jbzj.com/file_images/article/201812/20181212112610022.png?20181112112620)

指令格式：

```
install:install-file -Dfile=<Jar包的地址> 
           -DgroupId=<Jar包的GroupId> 
           -DartifactId=<Jar包的引用名称> 
           -Dversion=<Jar包的版本> 
           -Dpackaging=<Jar的打包方式>
```

如：

```
mvn install:install-file 
 -Dfile=F:\test.jar
 -DgroupId=test
 -DartifactId=test
 -Dversion=0.0.1
 -Dpackaging=jar
```

### **3、点击执行，显示“BUILD SUCCESS”即表示成功。**

```
<dependency>
  <groupId>test</groupId>
  <artifactId>test</artifactId>
  <version>0.0.1</version>
</dependency>
```


