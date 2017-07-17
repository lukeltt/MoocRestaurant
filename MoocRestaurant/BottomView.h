#import <UIKit/UIKit.h>

@interface BottomView : UIView
@property(nonatomic,copy) void (^nightBlock) (UISwitch * nightSwitch);
@end
