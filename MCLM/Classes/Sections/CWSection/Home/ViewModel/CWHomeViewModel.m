//
//  CWHomeViewModel.m
//  MCLM
//
//  Created by afarsoft on 2018/1/10.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import "CWHomeViewModel.h"
#import "AFNetHelper.h"
#import "AFNetworking.h"

@implementation CWHomeViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self getData];
    }
    return self;
}
- (void)getData {
    self.requestCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [AFNetHelper POST:HomeURL parameters:@{@"data":@"5OTRJ+JaknTfGVSdRqnTWqw9uFLc4ZO5KpWNx44uwze/KqPY2iyyOVB5KgwIOcOkqthkLwxQtW61gboPalEqJA=="} success:^(id responseObject) {
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
            } failure:^(NSError *error) {

            }];
            return nil;
        }];
        return signal;
    }];
}
@end
