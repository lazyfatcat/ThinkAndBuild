//
//  ViewController.m
//  pullDemo
//
//  Created by tyler huang on 5/17/15.
//  Copyright (c) 2015 tyler huang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView *navigationView;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    //CGRect rect = CGRectMake(0, 0, 420, 60);
    navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 420, 60)];
    navigationView.backgroundColor = [UIColor yellowColor];
    [navigationView setAlpha:0.0];
    //navigationView.opaque = YES;
    [self.view addSubview:navigationView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY  = scrollView.contentOffset.y;
    NSLog(@"offsetY --> %f", offsetY);
    CATransform3D transform = CATransform3DIdentity;
    //[self imageView].bounds.size.height
    if(offsetY < 0){
        CGFloat headerScaleFactor = -(offsetY) / _imageView.bounds.size.height;
         CGFloat headerSizevariation = ((_imageView.bounds.size.height * (1.0 + headerScaleFactor)) - _imageView.bounds.size.height)/2.0;
             transform = CATransform3DTranslate(transform, 0, headerSizevariation + offsetY, 0);
             transform = CATransform3DScale(transform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0);
        _imageView.layer.transform = transform;
    }
    else{
        CGFloat opacity = offsetY/44.0;//just hard code
        if (opacity >= 1.0) {
            opacity = 1.0;
            return ;
        }
        NSLog(@"customer navigation bar opacity %f", opacity);
        [navigationView setAlpha:opacity];
    }

    //transform = CATransform3DTranslate(transform, 0, -offsetY, 0);
    

 
}

@end
