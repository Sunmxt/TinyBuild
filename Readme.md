## TinyBuild

自用的自动推导 Makefile 模板。



由于不想每次新建一个小项目都需要重复编写 Makefile。所以写了这个通用的 Makefile 模板。比较适合自己写一些小东西使用，可以节省不少时间。

这个 Makefile 可以根据定义的依赖关系自动推导所需要的文件。而且依赖规则定义的方式非常简单。

---

##### 简单的例子

假设需要编译出两个可执行文件： *union* 、*intersection*

*union* 依赖于 *union.c* *tiny_array.c*

intersection 依赖于 *intersection.c* *tiny_array.c*

只要在 Makefile 开头简单定义：

```makefile
BIN:=union intersection
BIN_union_C:=union tiny_array
BIN_intersection_C:=intersection tiny_array
```

Makefile 会自动推导出 clean 和 make all 的规则。具体的效果：

![Example](Screenshot_example.png)

---

##### LICENSE

```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2012 Romain Lespinasse <romain.lespinasse@gmail.com>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```





