//
//  main.m
//  GEOCsvToSqlite
//
//  Created by 龚杰洪 on 2018/9/29.
//  Copyright © 2018年 龚杰洪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSVReader.h"
#import "DBManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc != 5) {
            NSLog(@"invalid params \neg. \nLocationXMLToSqlite -i [input path] -o [ouput path]");
            return 0;
        }
        
        NSString *inputPath = [[NSString alloc] initWithCString:argv[2] encoding:NSUTF8StringEncoding];
        NSString *outpuPath = [[NSString alloc] initWithCString:argv[4] encoding:NSUTF8StringEncoding];
        
        NSLog(@"inputPath = %@", inputPath);
        NSLog(@"outpuPath = %@", outpuPath);
        
        CSVReader *reader = [[CSVReader alloc] initWithInputPath:inputPath];
        DBManager *db = [[DBManager alloc] initWithDBPath: outpuPath];
        [db insertLocationInfo:reader.resultArray];
    }
    return 0;
}
