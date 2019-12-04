留言板系统的设计与实现
设计与实现一个个人网站留言板及用户注册系统（B/S）。本系统采用两层B/S系统，网页设计采用JSP，后台采用MySQL数据库。数据库包括注册用户信息表、留言信息表、管理员信息表，三张数据表实现系统的数据结构。在建立数据表时，必须保证数据的一致性和完整性。具体要求如下：
（1）用户留言信息（留言内容的新增、删除、修改、查询）；
（2）注册用户维护（用户信息的新增、删除、修改、查询）；
（3）按姓名查询用户留言信息；
（4）管理员可对用户注册的信息和所有用户的留言信息进行管理；
（5）用户的注册；
（6）判断用户标识和口令，并进行权限管理。
![1.登录页面](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/1.登录页面.png)



![2.1注册](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/2.1注册.png)



![2.2注册](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/2.2注册.png)



![2.3注册成功](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/2.3注册成功.png)



![2.4错误页面](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/2.4错误页面.png)

![3.1登录](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/3.1登录.png)



![3.2登陆成功](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/3.2登陆成功.png)



![3.3登录后的首页留言板列表](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/3.3登录后的首页留言板列表.png)



![4.1添加留言](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/4.1添加留言.png)



![4.2添加留言](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/4.2添加留言.png)



![4.3添加留言成功](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/4.3添加留言成功.png)



![4.4添加留言后的列表](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/4.4添加留言后的列表.png)



![5.1点击查看我的留言](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/5.1点击查看我的留言.png)



![5.2点击查看我的用户信息](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/5.2点击查看我的用户信息.png)



![5.3点击编辑更新我的留言](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/5.3点击编辑更新我的留言.png)



![5.4更新留言](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/5.4更新留言.png)



![5.5留言修改成功](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/5.5留言修改成功.png)



![5.6留言修改后的留言列表](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/5.6留言修改后的留言列表.png)



![6.1点击删除留言删除成功](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/6.1点击删除留言删除成功.png)



![6.2删除留言后的列表](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/6.2删除留言后的列表.png)



![7.1点击查看所有用户信息，只有管理员可以查看，普通用户看不了](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/7.1点击查看所有用户信息，只有管理员可以查看，普通用户看不了.png)



![7.2删除用户信息，只能删除普通用户，管理员之间删除不了](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/7.2删除用户信息，只能删除普通用户，管理员之间删除不了.png)



![7.3编辑用户信息，只能编辑普通用户信息，管理员的编辑不了](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/7.3编辑用户信息，只能编辑普通用户信息，管理员的编辑不了.png)



![7.4普通用户信息修改成功](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/7.4普通用户信息修改成功.png)



![8.1查询留言相关内容](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/8.1查询留言相关内容.png)



![8.2查询用户信息只有管理可以查询](https://raw.githubusercontent.com/RedBlueAlliance/liuyanban/master/留言板设计测试截图/8.2查询用户信息只有管理可以查询.png)

