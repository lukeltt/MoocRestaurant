#import "DisplayView.h"
#import "MyConstant.h"
#import "MaskView.h"

@interface DisplayView()<UIScrollViewDelegate>
@property(nonatomic,strong) NSArray * imageArray;
@property(nonatomic,strong) NSMutableArray * infoArray;
@end

UIScrollView * imageScrollView;
MaskView * maskView;

@implementation DisplayView

// 初始化DisplayView
-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 50,SCREEN_WIDTH , 200);
        [self addImageScrollView];
        [self addImage];
        maskView = [[MaskView alloc]init];
        [self addSubview:maskView];
    }
    return self;
}

// 添加ScrollView
-(void)addImageScrollView{
    imageScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    imageScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, 200);
    imageScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    imageScrollView.pagingEnabled = true;
    imageScrollView.delegate = self;
    [self addSubview:imageScrollView];
}
// 监听ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int curreneNum = scrollView.contentOffset.x/SCREEN_WIDTH;
    [maskView changeLabel:self.infoArray[curreneNum] Num:curreneNum];
}

// 添加图片
-(void)addImage{
    for (int i=0; i<self.imageArray.count; i++) {
        NSDictionary * dic = self.imageArray[i];
        NSString * imageName = [dic valueForKey:@"image"];
        NSString * imageInfo = [dic valueForKey:@"info"];
        [self.infoArray addObject:imageInfo];
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, 200)];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageScrollView addSubview:imageView];
    }
}

// 初始化imageArray
-(NSArray *)imageArray{
    NSDictionary * dic1 = @{@"image":@"1.png" , @"info":@"美味鸡排"};
    NSDictionary * dic2 = @{@"image":@"2.png" , @"info":@"葱爆素饼"};
    NSDictionary * dic3 = @{@"image":@"3.png" , @"info":@"油焖大虾"};
    
    if (!_imageArray) {
        _imageArray = [[NSArray alloc]initWithObjects:dic1,dic2,dic3,nil];
    }
    return _imageArray;
}

// 初始化infoArray
-(NSMutableArray *)infoArray{
    if (!_infoArray) {
        _infoArray = [[NSMutableArray alloc]init];
    }
    return _infoArray;
}
@end
