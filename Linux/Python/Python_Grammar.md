Python 3 
===========================================
Create Date: 2018-05-21, Alex
-------------------------------------------


# Python解释器 
 - CPython: 官方版本的解释器：CPython. 这个解释器是用C语言开发的，所以叫CPython
 - Ipython: Python是基于CPython之上的一个交互式解释器，也就是说，IPython只是在交互方式上有所增强，但是执行Python代码的功能和CPython是完全一样的
 - PyPy   : PyPy采用JIT技术，对Python代码进行动态编译（注意不是解释），所以可以显著提高Python代码的执行速度。
 - Jython : 运行在Java平台上的Python解释器，可以直接把Python代码编译成Java字节码执行
 - IronPython: 行在微软.Net平台上的Python解释器，可以直接把Python代码编译成.Net的字节码

# Output/Input

## Output
```Python
print(300)
print(100 + 200)
print('hello, world')
print('The quick brown fox', 'jumps over', 'the lazy dog')
```

## Input
```Python
name = input()
print('hello,', name)
name = input('please enter your name: ')
print('hello,', name)
```

# 数据类型和变量
  - 整数    `1，100，-8080，0`
  - 浮点数  `1.23，3.14，-9.01, 1.23x109就是1.23e9，或者12.3e8，0.000012可以写成1.2e-5`
  - 字符串  `'I\'m \"OK\"!'`, 用r''表示''内部的字符串默认不转义

# 编码
 - ASCII 
 - Unicode
 - UTF-8

# 字符串
  - print('包含中文的str')
  - ord('A')    # 65
  - ord('中')   # 20013
  - chr(66)     # 'B'
  - chr(25991)  # '文'
  - 'ABC'.encode('ascii')   # b'ABC'
  - '中文'.encode('utf-8')  # b'\xe4\xb8\xad\xe6\x96\x87'
  - b'ABC'.decode('ascii')  # 'ABC'
  - b'\xe4\xb8\xad\xe6\x96\x87'.decode('utf-8')  # '中文'
  - b'\xe4\xb8\xad\xff'.decode('utf-8', errors='ignore')  # '中'
  - len('ABC')      # 3
  - len('中文')     # 2
  - len(b'ABC')     # 3
  - len(b'\xe4\xb8\xad\xe6\x96\x87')    # 6
  - len('中文'.encode('utf-8'))         # 6

# 字符串格式化
  - 'Hello, %s' % 'world'           #'Hello, world'
  - 'Hi, %s, you have $%d.' % ('Michael', 1000000)  # 'Hi, Michael, you have $1000000.'
| 占位符 |	替换内容    |
| %d     |	整数        |
| %f 	 |  浮点数      |
| %s 	 |  字符串      |
| %x     | 	十六进制整数 |
 - 其中，格式化整数和浮点数还可以指定是否补0和整数与小数的位数
```Python
print('%2d-%02d' % (3, 1))
print('%.2f' % 3.1415926)
```
 - 字符串的format()方法，它会用传入的参数依次替换字符串内的占位符{0}、{1}……，不过这种方式写起来比%要麻烦得多：
```Python
'Age: %s. Gender: %s' % (25, True)      # 'Age: 25. Gender: True'
'growth rate: %d %%' % 7                # 'growth rate: 7 %'
'Hello, {0}, 成绩提升了 {1:.1f}%'.format('小明', 17.125)  # 'Hello, 小明, 成绩提升了 17.1%'
```


