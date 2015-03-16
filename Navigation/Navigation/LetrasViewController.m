//
//  LetrasViewController.m
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetrasViewController.h"
#import "LetraBViewController.h"

@interface LetrasViewController ()

@end

@implementation LetrasViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    self.title = @"A";
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Mostre uma palavra, uma figura e leia a palavra ao apertar um botao"
           forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
    
    
}

-(void)next:(id)sender {
    LetraBViewController *proximo = [[LetraBViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    
}

@end
