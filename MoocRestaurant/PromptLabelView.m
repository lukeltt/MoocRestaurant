#import "PromptLabelView.h"

@implementation PromptLabelView
// 初始化提醒数字标签
-(instancetype)initWithPoint:(CGPoint)point Message:(int)message{
    CGRect rect = CGRectMake(0, 0, 0, 0);
    NSString * str = nil;
    
    if (message <10) {
        rect = CGRectMake(point.x, point.y, 20, 20);
        str = [NSString stringWithFormat:@"%d",message];
    }else if (message <100){
        rect = CGRectMake(point.x, point.y, 40, 20);
        str = [NSString stringWithFormat:@"%d",message];
    }else {
        rect = CGRectMake(point.x, point.y, 40, 20);
        str = @"99+";
    }
    
    self = [super init];
    if (self) {
        self.frame = rect;
        self.backgroundColor = [UIColor redColor];
        self.text = str;
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:15];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true;
    }
    return self;
}
@end
