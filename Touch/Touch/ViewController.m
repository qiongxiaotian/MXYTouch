//
//  ViewController.m
//  Touch
//
//  Created by mxy on 2017/10/25.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "ViewController.h"
#import "MY_Extension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    UIButton *bt = [UIButton initWithFrame:CGRectMake(20, 100,100, 50) maker:^(UIButtonMaker *make) {
//        make.setTitle(@"七尺男儿").forState(UIControlStateNormal);
//        make.setTitleColor(UIColor.red()).forState(UIControlStateNormal);
//        make.setBackgroundColor(UIColor.hex(@"#ffddff")).forState(UIControlStateNormal);
//    }];
//
//    self.view.addSubview(bt);
//    bt.touchUpInside( ^() {
//        NSLog(@"点击了七尺男儿");
//    });
//
//    UIButton *cs = [UIButton initWithType:UIButtonTypeCustom frame:CGRectMake(20, 100, 100, 50) maker:^(UIButtonMaker *make) {
//        make.setTitle(@"六尺妹子");
//        make.setTitleColor(UIColor.green()).forState(UIControlStateNormal);
//        make.setBackgroundColor(UIColor.hex(@"#ffddff")).forState(UIControlStateNormal);
//        make.setCornerRadius(5).setBorderColor(UIColor.black()).setBorderWidth(2);
//    }];
//    self.view.addSubview(cs);
//    cs.touchUpInside(^(){
//        NSLog(@"点击了妹子");
//    });

    UILabel *th = [UILabel init:^(UILabelMaker *make) {
        make.setFrame(CGRectMake(20, 300, 100, 50));
        make.setText(@"一起当先");
        make.setTextColor(UIColor.blue());
        make.setTextAlignment(NSTextAlignmentCenter);
        make.setBorderColor(UIColor.red());
        make.setBorderWidth(2);
        make.setCornerRadius(5);
    }];
    self.view.addSubview(th);

    
    UIButton * newBt1 = UIButton.initWithFrame(CGRectMake(20, 100, 100, 50)).maker( ^(UIButtonMaker * make){
        make.setTitle(@"七尺大乳").forState(UIControlStateNormal);
        make.setTitleColor(UIColor.green()).forState(UIControlStateNormal);
        make.setBackgroundColor(UIColor.hex(@"#dedddd")).forState(UIControlStateNormal);
        make.setCornerRadius(5).setBorderColor(UIColor.black()).setBorderWidth(2);
        make.setFrame(CGRectMake(20, 100, 150, 50));
    });


    self.view.addSubview(newBt1);
    newBt1.touchUpInside( ^() {
        NSLog(@"newBt1---touch");
    });

    UILabel * newLa1 = UILabel.initWithFrame(CGRectMake(20, 200, 100, 50)).maker( ^(UILabelMaker * make) {

        make.setText(@"一骑当千");
        make.setTextColor(UIColor.blue());
        make.setTextAlignment(NSTextAlignmentCenter);
        make.setBorderColor(UIColor.red());
        make.setBorderWidth(2);
        make.setCornerRadius(5);
    });
    self.view.addSubview(newLa1);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
