//
//  CSVReader.h
//  GEOCsvToSqlite
//
//  Created by 龚杰洪 on 2018/9/29.
//  Copyright © 2018年 龚杰洪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSVReader : NSObject

- (instancetype)initWithInputPath:(NSString *)inputPath;

@property (nonatomic, strong) NSMutableArray *resultArray;

@end

NS_ASSUME_NONNULL_END
