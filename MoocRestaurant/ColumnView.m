#import "ColumnView.h"
#import "MyConstant.h"
#import "PromptLabelView.h"

@interface ColumnView()
@property (nonatomic,strong) NSArray * columnArray;
@end

UIScrollView * columnScrollView;

@implementation ColumnView

// 初始化ColumnView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0,SCREEN_WIDTH,50);
        self.backgroundColor = [UIColor magentaColor];
        self.columnArray = @[@"美食1",@"美食2",@"美食3",@"美食4",@"美食5",@"美食6"];
        [self addColumnScrollView];
        [self addButton];
    }
    return self;
}

// 添加ScrollView
-(void)addColumnScrollView{
    columnScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    columnScrollView.contentSize = CGSizeMake(100 * self.columnArray.count, 50);
    [self addSubview:columnScrollView];
}

// 添加按钮
-(void)addButton{
    for (int i =0; i<self.columnArray.count; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100*i, 0, 100, 50)];
        button.tag = 100 + i;
        [button setTitle:self.columnArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        
        if (i == 0) {
            button.layer.borderColor = [UIColor blueColor].CGColor;
            button.layer.borderWidth = 2;
            button.layer.cornerRadius = 5;
            PromptLabelView * promptLabelView = [[PromptLabelView alloc]initWithPoint:CGPointMake(80, 0) Message:50*i+9];
            [button addSubview:promptLabelView];
        }else{
            PromptLabelView * promptLabelView = [[PromptLabelView alloc]initWithPoint:CGPointMake(60, 0) Message:50*i+9];
            [button addSubview:promptLabelView];
        }
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [columnScrollView addSubview:button];
    }
}
-(void)buttonAction:(UIButton *)sender{
    sender.layer.borderColor = [UIColor blueColor].CGColor;
    sender.layer.borderWidth = 2;
    sender.layer.cornerRadius = 5;
    
    for (UIButton * item in columnScrollView.subviews) {
        if (item.tag >= 100 && item.tag <= 100+self.columnArray.count) {
            if (item.tag != sender.tag) {
                item.layer.borderWidth = 0;
            }
        }
    }
}
@end
