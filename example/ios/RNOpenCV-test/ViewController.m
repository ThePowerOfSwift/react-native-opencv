//
//  ViewController.m
//  RNOpenCV-test
//
//  Created by AnujKosambi on 29/05/16.
//  Copyright © 2016 dadevelopers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) RCTRootView *rootView;

@end

@implementation ViewController

@synthesize rootView;

- (void)viewDidLoad {
    [super viewDidLoad];
    rootView = [self setupRCTView];
}

-(RCTRootView *)setupRCTView {
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8080/index.ios.bundle?platform=ios&dev=true"];
    RCTRootView *rctView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName: @"RNOpenCVTest"
                                                 initialProperties:nil
                                                     launchOptions:nil];

    [self.view addSubview:rctView];
    rootView.frame = self.view.bounds;
    return rctView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
