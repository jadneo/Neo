//
//  NSObject+KVO.h
//  ImplementKVO
//
//  Created by Peng Gu on 2/26/15.
//  Copyright (c) 2015 Peng Gu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (KVO)


- (void)addObserver:(NSObject *)observer forAllKeyPathOptions:(NSKeyValueObservingOptions)options context:(void *)context;


- (void)removeObserver:(NSObject *)observer forAllKeyPathContext:(void *)context;



@end
