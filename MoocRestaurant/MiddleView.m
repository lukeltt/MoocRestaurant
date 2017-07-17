#import "MiddleView.h"
#import "MyConstant.h"
#import "ColumnView.h"
#import "DisplayView.h"
#import "NewsView.h"

@implementation MiddleView

// 初始化MiddleView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 80,SCREEN_WIDTH , SCREEN_HEIGHT-180);
        self.backgroundColor = [UIColor whiteColor];
        
        ColumnView * columnView = [[ColumnView alloc]init];
        [self addSubview:columnView];
        
        DisplayView * displayView = [[DisplayView alloc]init];
        [self addSubview:displayView];
        
        NewsView * newsView1 = [[NewsView alloc]initWithFrame:CGRectMake(0, 250, SCREEN_WIDTH, 100)];
        [newsView1 changeImage:@"4.png" Text:@"美食特惠，都到碗里来！" URL:@"http://www.imooc.com"];
        [self addSubview:newsView1];
        
        NewsView * newsView2 = [[NewsView alloc]initWithFrame:CGRectMake(0, 350, SCREEN_WIDTH, 100)];
        [newsView2 changeImage:@"5.png" Text:@"新品上市！超美味冰淇凌！" URL:@"http://www.imooc.com"];
        [self addSubview:newsView2];
    }
    return self;
}
@end
