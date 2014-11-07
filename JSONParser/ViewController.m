//
//  ViewController.m
//  JSONParser
//
//  Created by Mubashir Meddekar on 14/10/2014.
//  Copyright (c) 2014 Mubashir Meddekar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  
}

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * Requrl = @"http://api.kivaws.org/v1/loans/search.json?status=fundraising";
    
    NSURL * url = [NSURL URLWithString:Requrl];
    
    NSMutableURLRequest * UrlReq = [NSMutableURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:UrlReq returningResponse:&response error:&error];
    
    if (data.length ==0) {
        NSLog(@"No Data to display");
    }
    else
    {
        NSLog(@"%i",[data length]);
    }
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
