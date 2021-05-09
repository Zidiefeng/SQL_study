### MySQL

此repo记录了我学习MySQL（狂神说Java系列）的笔记和代码：

- [个人学习笔记](https://github.com/Zidiefeng/CSS_study/tree/master/docs)
- [code](https://github.com/Zidiefeng/CSS_study) （`lesson01` ~ `lesson07`）

---

### Content

- 初识
    - CSS概念
        - CSS在网页中的应用
        - CSS发展史 （1.0， 2.0，3.0）
        - CSS优势
    - CSS语法：`style`
    - 3种引入方式：行内样式，内部样式，外部样式
    - CSS选择器
        - 基本选择器：element, class(`.`), id(`#`)
        - 层次选择器：
            - 层次选择器(后代：空格，下一级`>`, 通用 `~`, 相邻兄弟 `+`)
            - 结构伪类选择器
            - 属性选择器 (标签+属性值) a[`*` `^` `$`]
- 美化网页
    - 字体：`color`, `font-size`
    - 排版网页：`text-align`, `text-indent`, `line-height`, `text-decoration`
    - 超链接伪类：hover
    - 列表：list-style
    - 背景：
        - 背景颜色：background-color
        - 背景图片：repeat，渐变背景 （网站）
- 盒子模型
    - border, padding, margin
    - 盒子模型尺寸计算：border+margin+padding+内容element
    - box-size
    - 圆角边框 border-radius
    - 阴影 box-shadow
- 浮动
    - 网页布局-标准文档流
    - display: block. inline, inline-block
    - 浮动 float：左，右，none
    - 清除浮动：clear (left, right, both, none)
    - 解决父级border塌陷
        - 空div
        - 父级高度固定
        - overflow
        - :after
    - inline-block和float区别
- 定位
    - 默认：静态定位
    - relative定位
    - absolute定位
    - fixed
    - z-index
    - opacity
