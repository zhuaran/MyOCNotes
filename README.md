UIprogressview进度条不更新

最近在做智能音箱播放器页面的时候有个播放进度条，用的是progressview，但是根据状态赋值后，状态条不更新进度，后来调试发现是进度值的精度问题，例如pv.progress = 0.18827299281223这样的值的时候，进度条更新就出现问题了，所以进度值需要格式化一下
[[NSString stringWithFormat:@"%.4f0",progressNum]doubleValue]这样得到的值为CGfloat value = 0.1882,
%.4f0,代表取四位小数点，f代表4位小数后面的精度值全部省略，用doubleValue转化一下即可。
