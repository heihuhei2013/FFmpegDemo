//
//  ViewController.m
//  FFmpeg_Test
//
//  Created by mac on 16/7/11.
//  Copyright © 2016年 xiayuanquan. All rights reserved.
//

#import "ViewController.h"

#include <stdio.h>
#import <libavformat/avformat.h>
#import <libavcodec/avcodec.h>

#define LERP(A,B,C) ((A)*(1.0-C)+(B)*C)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"test.mp4" ofType:nil];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSData *testData = [NSData dataWithContentsOfURL:fileURL options:NSDataReadingUncached error:nil];
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *tmpVideoStr = [tmpPath stringByAppendingPathComponent:@"tmptest.mp4"];
    [testData writeToFile:tmpVideoStr atomically:YES];
//    const char *url = [filePath cStringUsingEncoding:NSUTF8StringEncoding];
    const char *url =  [tmpVideoStr cStringUsingEncoding:NSUTF8StringEncoding];

    av_register_all();
    
    AVFormatContext *pFormatContext;
    if(avformat_open_input(&pFormatContext, url, NULL, NULL) < 0){
        
        printf("%s \n" , "avformat_open_input failure");
        return ;
    }
    av_dump_format(pFormatContext, <#int index#>, <#const char *url#>, <#int is_output#>)
    
    
    
   
}

@end
