//
//  LetraView.h
//  Navigation
//
//  Created by Jorge Henrique P. Garcia on 3/16/15.
//  Copyright (c) 2015 Jorge Henrique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Letra.h"
#import "ListaTableViewController.h"

/*
@protocol LetraViewDelegate <NSObject>

    -(void)next: (id)sender;

@end
*/
 
@interface LetraView : UIViewController <UINavigationBarDelegate>

+ (instancetype)sharedInstance;

@property Letra *letra;
@property int index;
@property NSMutableArray *letras;


@property UILabel *labelPalavra;
@property UIImageView *imageView;

//@property (nonatomic, assign) id<LetraViewDelegate> delegate;

-(instancetype)initWithLetra: (Letra*) l;

-(void)previous:(id)sender;
-(void)next:(id)sender;
-(void)editar:(id)sender;

-(instancetype) novo: (Letra*) obj;



@end
