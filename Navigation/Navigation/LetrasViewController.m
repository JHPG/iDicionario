//
//  LetrasViewController.m
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetrasViewController.h"
#import "LetraView.h"

@interface LetrasViewController ()

@end

@implementation LetrasViewController

//+ (instancetype)sharedInstance {
//    
//    static dispatch_once_t onceToken = 0;
//    __strong static LetrasViewController *instance = nil;
//    dispatch_once(&onceToken,^{
//        
//        instance = [[self alloc] init];
//        
//    });
//    return instance;
//}

-(void) viewDidLoad {
    [super viewDidLoad];
    
    UINavigationItem *item = self.navigationController.navigationBar.topItem;
    [item setTitle:@"Inicio"];
    
    LetraView *view = [[LetraView alloc] init];
    [self showViewController:view sender:nil];
}

@end
