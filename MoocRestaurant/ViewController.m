#import "ViewController.h"
#import "MyConstant.h"
#import "TopView.h"
#import "MiddleView.h"
#import "BottomView.h"

@interface ViewController ()
@end

TopView * topView;
MiddleView * middleView;
BottomView * bottomView;

UIButton * searchButton;
UIView * searchView;

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    topView = [[TopView alloc]init];
    [self.view addSubview:topView];
    middleView = [[MiddleView alloc]init];
    [self.view addSubview:middleView];
    bottomView = [[BottomView alloc]init];
    [self.view addSubview:bottomView];
    
    [self addSearchButton];
    [self nightMode];
}

// 添加搜索按钮
-(void)addSearchButton{
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(350, 20, 40, 40)];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
}
-(void)searchButtonAction{
    searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT-80)];
    searchView.backgroundColor = [UIColor whiteColor];
    UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    [searchView addSubview:searchBar];
    [self.view addSubview:searchView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [searchButton resignFirstResponder];
    if (searchView) {
        [searchView removeFromSuperview];
        searchView = nil;
    }
}

// 暗夜模式
-(void)nightMode{
    bottomView.nightBlock = ^(UISwitch *nightSwitch) {
        if (nightSwitch.isOn) {
            topView.backgroundColor = [UIColor darkGrayColor];
            middleView.backgroundColor = [UIColor blackColor];
            bottomView.backgroundColor = [UIColor darkGrayColor];
        }else{
            topView.backgroundColor = [UIColor cyanColor];
            middleView.backgroundColor = [UIColor whiteColor];
            bottomView.backgroundColor = [UIColor lightGrayColor];
        }
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
