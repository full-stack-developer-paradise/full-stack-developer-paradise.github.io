---
layout: post 
title: "TypeScript-JavaScript的超集" 
categories: JavaScript 
tags: TypeScript 语言 
author: 李武帝 
---

* content
{:toc}

## 一、基本介绍

官方文档：https://www.tslang.cn/

意义：让前端有了变量类型的概念。

## 二、相关语法

#### 1、类型注解
```typescript
function test(prams: string):string {
    return 'Prams is ' + prams;
}
let prams:string = 'liwudi';
let b:boolean = true;
let c:object = {};
let d:number = 1;
let e:any = 333;
```
一般而言，类型注解主要是对变量进行类型验证的。包括（变量、函数返回值、函数的参数等）



#### 2、接口

接口，定义了一种模式，让某些类，必须实现某些方法。
```typescript
interface InterfaceName {
  firstName: string;
  secondName?: string;
}

class Me implements InterfaceName {
  firstName: string = 'li';
  secondName: string = 'wudi';
  getName(): void {
    console.log('my name is ' + this.firstName + this.secondName);
  }
}
let me: Me = new Me();
me.getName();
```
#### 3、class（类）

Es5进行类的描述方式：
```typescript
function Person(name, age) {
  this.name = name;
  this.age = age;
}
Person.prototype.getName = function() {
  return this.name;
};
```
主要核心表现在两个概念上，一个叫实例、一个叫原型。继承方面主要使用call、apply实现实例的继承，prototype实现原型继承。



Es6的方式:
```typescript
class Person {
  constructor(name) {
    this.name = name;
  }
  getName() {
    console.log(this.name);
    return this.name;
  }
}
new Person('liwudi').getName();
```
Es6中，有实例属性，也有对应的原型方法，实例属性和实例方法，定义在构造函数constructor中，而原型方法定义在构造函数外面。
继承方面，使用super实现继承。



Ts的类的表达方式:

在TypeScript中，实例属性必须在构造函数外部申明。
```typescript
class ClassName {
  firstName: string = 'li';
  secondName: string = 'wudi';
  getName(): void {
    console.log('my name is ' + this.firstName + this.secondName);
  }
}
```

继承方式的区别:

ES5 的继承，实质是先创造子类的实例对象this，然后再将父类的方法添加到this上面（Parent.apply(this)）。ES6 的继承机制完全不同，实质是先将父类实例对象的属性和方法，加到this上面（所以必须先调用super方法），然后再用子类的构造函数修改this。



TypeScript特有的访问控制修饰符：public、protected、private、readonly。

- public，类、派生类、类的外部，都能够访问该类的属性或者方法。
- protected，类以及派生类可以访问。
- private，只有类本身能够访问的属性和方法。
- readonly，将属性设置为只读的。 只读属性必须在声明时或构造函数里被初始化。
```typescript
class ClassA {
  private myname = 'liwudi';
  getName(): string {
    return this.myname;
  }
}
console.log(new ClassA().getName());
````
readonly只能用来描述属性，而不能用来描述方法。
```typescript
class ClassA {
  readonly myname = 'liwudi';
  getName(): string {
    return this.myname;
  }
}
console.log(new ClassA().getName());
```

TypeScript特有的抽象类:
```typescript
abstract class AbsClass {
  myname: string;
  abstract getName(): string;
}
class MyClass extends AbsClass {
  myname: string = 'liwudi_';
  getName(): string {
    return this.myname;
  }
}
const me = new MyClass();
console.log(me.getName());
```

TypeScript也支持ES6的其他特性，比如get、set。比如 static关键字(static的支持，在ES7中)。



#### 4、数据类型

拥有JavaScript中常见的：string、boolean、number、symbol、null、undefined。

还包括：array、object、tuple、enum、void、any、never。
```typescript
let prams: string = 'liwudi';
let b: boolean = true;
let c: object = {};
let d: number = 1;
let e: any = 333;
```

定义一个数组：数组有两种定义的方式，一种是在类型后面加上[]，另一种是使用Array\<T>，数组泛型。
```typescript
let arr: number[] = [1, 2, 3];
let arr1: string[] = ['1','4','3'];
let arr2: Array<number> = [1, 2, 3];
```

不能使用下面的方式，定义一个数组：
```typescript
let arr3: Array<T> = [1, 2, 3]; // 没有这样的用法
```
定义一个对象：
```typescript
// object
let obj: object = {
  name: 'liwudi'
};
```

定义一个元组：
```typescript
let xx: [number, string] = [1, 'hello'];
console.log('元组：', xx[0], xx[1]);
```

枚举类型：
```typescript
enum CaseType { Will, Doing, Finish }
```

定义一个Any类型的数据：
```typescript
// any
let anyVar: any = 1;
anyVar = 'liwudi';
let anyArr: any[] = [1, 'li', null];
```

定义一个Void类型的数据：
```typescript
function voidFun(): void {
  console.log(1)
}
```
说明：void类型一般用于函数，而一般不用于变量，如果非要定义一个void类型的数据，那么它只能被赋值为null、undefined。
```typescript
let voidVar: void = null;
voidVar = undefined;
voidVar = 1; // 出错
```
#### 5、函数

函数的类型
```typescript
function a (x, y) {
  return x + y;
}
function a1 (x: number, y: number): number {
  return x + y;
}
let a2 = function (x: number, y: number): number {
  return x + y;
};
let a3:(x: number, y: number) => number = function (x: number, y: number) {
  return x + y;
};
```

TypeScript中，每一个参数都是必然要传递进函数中，而JavaScript中，可以传参数，也可以不传参数，不传递参数，就是undefined。



可选参数：如果你不确定这个参数是不是要传递，那面可以使用一个可选参数的方式，进行参数传递，可选参数必须在必选参数后面。

function a(x: number, y?: number) {
  return x + y;
}


默认参数，当你希望给一个函数的参数给一个默认值的时候，可使用默认参数。

function a(x = 'liwudi', y: string) {
  return x + '' + y;
}


剩余参数（...）

function func1(arg1: string, ...rest: string[]): string {
  return arg1 + rest.join('!');
}


#### 6、泛型



泛型，参数化类型，也就是把原本确定的数据类型参数化，在调用阶段的时候，根据不同的类型参数，来确定不同参数的限制类型。



泛型的使用过程中，数据类型被定义为变量，可以用在函数、接口、类中。分别被称为泛型函数、泛型接口、泛型类。



关于泛型函数：
```typescript
function fun<T>(arg: T): T {
  return arg;
}
let aaaa: string = fun('aaa');
console.log(aaaa);
let bbbb: string = fun<string>('bbb');
console.log(bbbb);
```

泛型类：
```typescript
class Person<T> {
  arr: T[];
  add (item: T) {
    this.arr.push(item);
  }
  getMin () {
    let min: T = this.arr[0];
    for (let i = 0; i < this.arr.length; i++) {
      if (this.arr[i] < min) {
        min = this.arr[i]
      }
    }
    return min;
  }
}
```

泛型接口：

interface InterName<T> {
  idNo: T;
  idList: T[];
}


#### 7、装饰器

装饰器，是一个函数，用来描述一个类、或者方法的一些新的特征或者行为。
```typescript
function myDecorators(target) {
  target.myname = 'liwudi';
}
@myDecorators
class Person {
  static myname: string;
}
console.log(Person.myname);
```

装饰器工厂：以return一个function的方式，让我们可以自己定义装饰器的接收参数值。
```typescript
function testAble(value) {
  return (target) => {
    target.prototype.isTrue = value;
  };
}
@testAble('test message')
class ClassA {
  isTrue: string;
}
console.log(new ClassA().isTrue);
```

## 三、在实际项目中的应用

1、在Angular2中的使用

```typescript
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'angular-pro';
}
```

2、在React中的使用
```typescript
import React, { Component } from 'react'
import { withRouter } from 'react-router-dom'
import RegisterSuccessContentWrap, {
  RegisterSuccessContent,
  RegisterSuccessText,
  Login
} from './RegisterSuccess.styled'

type DefaultProps = {
  history: null,
  location: Object
}

type Props = {
  history?: {
    push (path: string): void
 } | null,
  location: Object | null,
}

@withRouter
class RegisterSuccess extends Component<DefaultProps, Props, void> {
  defaultProps: DefaultProps
  props: Props
  static displayName = 'RegisterSuccess'
 static defaultProps = {
    history: null,
    location: null
 }
  constructor (props: Object) {
    super(props)
    const { history, location } = this.props
 if (!history) {
      return null
 }
    if (!location) {
      return null
 }
    const state: Object = location.state
    if (!state || state.pre !== 'fromRegister') {
      history.push('/application')
    }
  }
  render (): React.Element<any> | null {
    return (
      <div>
        <RegisterSuccessContentWrap>
          <RegisterSuccessContent>
            <RegisterSuccessText>注册成功，请前往登录</RegisterSuccessText>
 <Login
    href={process.env.URL_PASSPORT}
      >
      前往登录
      </Login>
 </RegisterSuccessContent>
 </RegisterSuccessContentWrap>
 </div>
 )
  }
}

export default RegisterSuccess;
```
