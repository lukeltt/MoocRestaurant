#import "NewsView.h"
#import "MyConstant.h"

@interface NewsView()
@property(nonatomic,strong) UIImageView * newsImage;
@property(nonatomic,strong) UILabel * newsLabel;
@property(nonatomic,strong) UILabel * URL;
@end

@implementation NewsView

// 初始化NewsView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.newsImage];
        [self addSubview:self.newsLabel];
        [self addSubview:self.URL];
    }
    return self;
}

// 初始化newsImage
-(UIImageView *)newsImage{
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    return _newsImage;
}

// 初始化newsLabel
-(UILabel *)newsLabel{
    if (!_newsLabel) {
        _newsLabel = [[UILabel alloc]initWithFrame:CGRectMake(100,0,SCREEN_WIDTH-100, 50)];
        _newsLabel.textColor = [UIColor blueColor];
        _newsLabel.font = [UIFont systemFontOfSize:15];
        _newsLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _newsLabel;
}

// 初始化URL
-(UILabel *)URL{
    if (!_URL) {
        _URL = [[UILabel alloc]initWithFrame:CGRectMake(100,50,SCREEN_WIDTH-100,50)];
        _URL.textColor = [UIColor orangeColor];
        _URL.font = [UIFont systemFontOfSize:15];
        _URL.textAlignment = NSTextAlignmentCenter;
    }
    return _URL;
}

// 动态改变
-(void)changeImage:(NSString *)image Text:(NSString *)text URL:(NSString *)url{
    self.newsImage.image = [UIImage imageNamed:image];
    self.newsLabel.text = text;
    self.URL.text = url;
}
@end
