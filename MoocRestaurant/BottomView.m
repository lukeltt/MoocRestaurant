#import "BottomView.h"
#import "MyConstant.h"

@implementation BottomView

// 初始化BottomView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, SCREEN_HEIGHT-100,SCREEN_WIDTH , 100);
        self.backgroundColor = [UIColor lightGrayColor];
        [self addNightLabel];
        [self addNightSwitch];
    }
    return self;
}

// 添加暗夜模式标签
-(void)addNightLabel{
    UILabel * nightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, 100, 30)];
    nightLabel.text = @"暗夜模式:";
    nightLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:nightLabel];
}

// 添加暗夜模式开关
-(void)addNightSwitch{
    UISwitch * nightSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(100, 35, 30, 20)];
    [nightSwitch addTarget:self action:@selector(nightSwitchAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:nightSwitch];
}
-(void)nightSwitchAction:(UISwitch *)sender{
    if (self.nightBlock) {
        self.nightBlock(sender);
    }
}
@end
