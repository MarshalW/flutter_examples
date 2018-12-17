# 存放所有Flutter技术准备的实验示例

## 版本分支

* `custom_render_box`，用自定义RenderBox实现绘制Widget的hello world
* `helloworld_rendering`，通过rendering api，在渲染树上显示hello world的内容
* `helloworld_raw`，使用`dart.ui`，最底层的api渲染界面的hello world
* `dynamic_async_load_list`，在`asyc_load_list`分支基础上，增加上拉刷新和下拉更多
* `navigate_get_state_from_ancestor`，使用`ancestorWidgetOfExactType`，导航后获取State
* `before_use_inherited_widget`，不使用InheritedWidget，更原始的方式，使用`ancestorWidgetOfExactType`
* `asyc_load_list`，异步加载网络数据，并作为列表显示
* `async_loading_inherited_widget`，增加异步加载的情况，在`navigate_with_inherited_widget`基础上实现
* `navigate_with_inherited_widget`，路由导航的情况下，使用InheritedWidget
* `simple_inherited_widget`，一个最简单的InheritedWidget示例
* `create_my_inherited_widget`，写的第一个自定义InheritedWidget的示例，还是不够简明，打算再重开分支写新的示例
* `how_to_get_widget_height`，获得任意widget的尺寸和高度
* `hello_world`，最简单的示例，将Android studio自动生成的项目做了再次简化
