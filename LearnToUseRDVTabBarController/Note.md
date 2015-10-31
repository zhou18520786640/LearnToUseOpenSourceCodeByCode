### 场景
系统自带的TabbarController功能有限，限制太多。RDVTabBarController是高度自定义的TabbarController

### 功能
1. 支持嵌入UINavigationController.
2. 可配置TabbarItem的普通背景色和选中的背景色。同时可以配置普通模式下图像和高亮时图像
3. 实现了可定制化的红点.
4. 支持iphone和ipad.

### 常识
** 不是使用backgroundColor
使用UIImage 来初始化item背景色,而且UIImage的尺寸并不是和item尺寸一样。需要准备的UIImage是 1*44的图和 2*88的2倍图。API如下**

     [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];

** 通过运行时可以实现在子视图控制器中直接访问RDVTabBarController。需要import头文件 **
  
  	#import "RDVTabBarController.h"
  	// ......
    [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
    
### 简单用法
基本步骤：1.放入视图控制器 2.定制化视图控制器



    // FirstViewController
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    firstViewController.title = @"First";
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    
    // SecondViewController
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.title = @"Second";
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    
    
    // ThirdViewController
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    thirdViewController.title = @"Third";
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
    
    tabBarController.viewControllers = @[navigationController1, navigationController2, navigationController3];

定制化视图控制器
* 隐藏和显示tabbar
* 设置选中的item

定制化Baritem
* 选中的和未选中的背景色
* 选中和未选中的图案



