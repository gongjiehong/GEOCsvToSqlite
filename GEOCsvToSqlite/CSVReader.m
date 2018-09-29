//
//  CSVReader.m
//  GEOCsvToSqlite
//
//  Created by 龚杰洪 on 2018/9/29.
//  Copyright © 2018年 龚杰洪. All rights reserved.
//

#import "CSVReader.h"

@implementation CSVReader

- (instancetype)initWithInputPath:(NSString *)inputPath
{
    self = [super init];
    if (self) {
        _resultArray = [NSMutableArray array];
        [self decodeWithInputPath:inputPath];
    }
    return self;
}

- (void)decodeWithInputPath:(NSString *)inputPath
{
    FILE *fp = fopen([inputPath UTF8String], "r");
    if (fp) {
        char buf[BUFSIZ];
        fgets(buf, BUFSIZ, fp);
        NSString *a = [[NSString alloc] initWithUTF8String:(const char *)buf];
        NSString *aa = [a stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        aa = [aa stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        //获取的是表头的字段
        NSArray *b = [aa componentsSeparatedByString:@","];
        
        while (!feof(fp)) {
            char buff[BUFSIZ];
            fgets(buff, BUFSIZ, fp);
            //获取的是内容
            NSString *s = [[NSString alloc] initWithUTF8String:(const char *)buff];
            NSString *ss = [s stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            ss = [ss stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            NSArray *a = [ss componentsSeparatedByString:@","];
            
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            for (int i = 0; i < b.count ; i ++) {
                //组成字典数组
                dic[b[i]] = a[i];
            }
            
            [_resultArray addObject:dic];
        }
    }
}

@end
