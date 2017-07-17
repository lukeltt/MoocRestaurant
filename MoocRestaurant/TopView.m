#import "TopView.h"
#import "MyConstant.h"

@implementation TopView

// 初始化TopView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0,SCREEN_WIDTH , 80);
        self.backgroundColor = [UIColor cyanColor];
        [self addLabel];
    }
    return self;
}

// 添加标签
-(void)addLabel{
    UILabel * label = [[UILabel alloc]init];
    label.text = @"慕课网餐厅";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:25];
    CGSize labelWH = [label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName,nil]];
    label.frame = CGRectMake((SCREEN_WIDTH-labelWH.width)/2, (80-labelWH.height)/2, labelWH.width, labelWH.height);
    [self addSubview:label];
}
@end
