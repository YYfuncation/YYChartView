//
//  ViewController.m
//  YYChartView
//
//  Created by Liandi on 2019/1/17.
//  Copyright © 2019年 Liandi. All rights reserved.
//

#import "ViewController.h"
#import "AAChartKit.h"

@interface ViewController ()<AAChartViewDidFinishLoadDelegate>
@property(nonatomic , strong) AAChartView *aaChartView;
@property (nonatomic, strong) AAChartModel *aaChartModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height-250;
    _aaChartView = [[AAChartView alloc]init];
    _aaChartView.frame = CGRectMake(0, 60, chartViewWidth, chartViewHeight);
    //_aaChartView.scrollEnabled = NO;
    //// set the content height of aaChartView
    // _aaChartView.contentHeight = chartViewHeight;
    [self.view addSubview:_aaChartView];
    
    AAChartType chartType;
    chartType = AAChartTypeLine;//设置图表类型
    [self setUpTheAAChartViewWithChartType:chartType];
}

#pragma mark - 图表设置
- (void)setUpTheAAChartViewWithChartType:(AAChartType)chartType {
    self.aaChartView.delegate = self;
    self.aaChartView.scrollEnabled = NO;//禁用 AAChartView 滚动效果
    //    设置aaChartVie 的内容高度(content height)
    //    self.aaChartView.contentHeight = 150;
    
    //设置 AAChartView 的背景色是否为透明
    self.aaChartView.isClearBackgroundColor = YES;
    
    self.aaChartModel = AAChartModel.new
    .chartTypeSet(chartType)//图表类型
    .titleSet(@"")//图表主标题
    .subtitleSet(@"")//图表副标题
//    .legendEnabledSet(false)//是否显示图例
    .colorsThemeSet(@[@"#fe117c",@"#ffc069",@"#06caf4",@"#7dffc0"])//设置主体颜色数组
    .yAxisTitleSet(@"")//设置Y轴标题
    .tooltipValueSuffixSet(@"")//设置浮动提示框单位后缀
    .backgroundColorSet(@"#4b2b7f")
    .yAxisGridLineWidthSet(@0);//y轴横向分割线宽度为0(即是隐藏分割线)
    
    _aaChartModel.markerRadius = @3;//设置折线连接点的半径长度
    _aaChartModel.categories = @[@"Java",@"Swift",@"Python",@"Ruby", @"PHP",@"Go",@"C",@"C#",@"C++"];//设置 X 轴坐标文字内容
    _aaChartModel.seriesSet(@[
                              AASeriesElement.new
                              .nameSet(@"2017")
                              .dataSet(@[@7.0, @6.9, @9.5, @14.5, @18.2, @21.5, @25.2, @26.5, @23.3, @18.3, @13.9, @9.6]),
                              AASeriesElement.new
                              .nameSet(@"2018")
                              .dataSet(@[@0.9, @0.6, @3.5, @8.4, @13.5, @17.0, @18.6, @17.9, @14.3, @9.0, @3.9, @1.0]),
                              AASeriesElement.new
                              .nameSet(@"2019")
                              .dataSet(@[@12.0, @8.9, @3.5, @4.5, @8.2, @2.5, @5.2, @6.5, @3.3, @8.3, @3.9, @19.6]),
                              ]);
    
    
    /*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
    //        [self configureTheYAxisPlotLineForAAChartView];
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 图表AAChartView delegate
- (void)AAChartViewDidFinishLoad {
    NSLog(@"🔥🔥🔥🔥🔥 AAChartView content did finish load!!!");
}

@end
