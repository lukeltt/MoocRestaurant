#import "MaskView.h"
#import "MyConstant.h"

@interface MaskView()
@property(nonatomic,strong) UILabel * imgLabel;
@property(nonatomic,strong) UIPageControl * pageControl;
@end

@implementation MaskView

// 初始化MaskView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 180, SCREEN_WIDTH, 20);
        self.backgroundColor = [UIColor darkGrayColor];
        self.alpha = 0.5;
        [self addSubview:self.imgLabel];
        [self addSubview:self.pageControl];
    }
    return self;
}

// 初始化imgLabel
-(UILabel *)imgLabel{
    if (!_imgLabel) {
        _imgLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-100, 20)];
        _imgLabel.textColor = [UIColor whiteColor];
        _imgLabel.font = [UIFont systemFontOfSize:15];
        _imgLabel.text = @"葱爆素饼";
        _imgLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _imgLabel;
}

// 初始化pageControl
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 0, 100, 20)];
        _pageControl.numberOfPages = 3;
        _pageControl.currentPage = 1;
    }
    return _pageControl;
}

// 动态改变
-(void)changeLabel:(NSString *)item Num:(int)number{
    self.imgLabel.text = item;
    self.pageControl.currentPage = number;
}
@end
