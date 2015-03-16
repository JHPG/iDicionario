//
//  LetrasViewController.h
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LetraView.h"

@interface LetrasViewController : UIViewController //<LetraViewDelegate>

@property NSMutableArray *letras;
@property int index;

//+(instancetype)sharedInstance;

@end
