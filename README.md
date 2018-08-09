# k 线图，深度图，分时图

目前完成深度图

![深度图](https://github.com/yumengbdw/Kline/blob/master/QDKline/image/deevView.png)



##深度图

必须要有两个值，`volume` 和`price`，`price` 横坐标，`volume` 纵坐标

1.`x` 轴等间距划分，这种不是很合理
2.算出`x` 距离和时间的比值` unit`，根据 `unit` 换算成对应`x`的坐标。


y 轴位置：
unitY = maxValue/4;
数轴分5个 unitY 顶部空出1个 unitY 好看。


长按的时候根据 x 来判断确定长按的点为离 model 里面 x 最近的点。




##分时图

因为有成交量的柱状图，所以每个 `model` 的宽度固定的。
- 不可左右滑动 `width/count` 确定 `model` 宽度
- 可以左右滑动 此时每一个 `model`数据对应宽度固定，
``ScrollView  content的总宽度 = 单位宽度 * count。``


完善的应该支持左右滑动的。以及放大缩小

长按显示十字指示线的时候

1.根据 `touch` 的位置`X_Offset/ 宽度` 可以得到model 在数组中的 `index`，从而获取 `model` 对象。
`X_Offset = scrollView.contentOffset + locationPoint.x`
2.十字指示线 X 的位置可以固定到某个 `model` 上
y 轴的位置不确定，所以横线y轴位置是确定model 对应点的 y 轴位置。
