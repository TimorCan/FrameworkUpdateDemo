//
//  Download.m
//  update
//
//  Created by 江苏齐欣技术部电脑 on 16/2/16.
//  Copyright © 2016年  jsqx-macbook air. All rights reserved.
//

#import "Download.h"
#import "ZipArchive.h"
@implementation Download

-(NSString *)DownloadTextFile:(NSString*)fileUrl fileName:(NSString *)_fileName
{
    NSArray *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = documentsPath[0];
    
    
    NSFileManager *filemanager =[NSFileManager defaultManager];
    NSString *filePath =[documentPath stringByAppendingPathComponent:@"/UpdateFrame.framework.zip"];
    
    if ([filemanager fileExistsAtPath:filePath]) {
    
//        ZipArchive* zip = [[ZipArchive alloc] init];
//        if ([zip UnzipOpenFile:filePath]) {
//            
//            BOOL ret =[zip UnzipFileTo:documentPath overWrite:YES];
//            
//            if (ret == YES) {
//                NSLog(@"解压成功");
//            }
//        }

        
        
    }else
    {
        NSString *datapath = [[[NSBundle mainBundle]bundlePath]stringByAppendingString:@"/UpdateFrame.framework.zip"];
        NSError *error;
        
        if ([filemanager copyItemAtPath:datapath toPath:filePath error:&error]) {
             ZipArchive* zip = [[ZipArchive alloc] init];
            if ([zip UnzipOpenFile:filePath]) {
                
                BOOL ret =[zip UnzipFileTo:documentPath overWrite:YES];//解压
                if(ret == YES)
                {
                     NSLog(@"解压成功");
                }
               
            }
            NSLog(@"success");
        }
    }
    
    
    return documentPath;
    
}

@end
