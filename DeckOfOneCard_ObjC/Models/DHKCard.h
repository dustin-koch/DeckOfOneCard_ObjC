//
//  DHKCard.h
//  DeckOfOneCard_ObjC
//
//  Created by Dustin Koch on 5/21/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHKCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *imageUrl;
@property (nonatomic, copy, readonly) NSString *code;

- (instancetype) initWithSuit:(NSString *)suit url:(NSString *)imageUrl code:(NSString *)code;

- (instancetype) initWithDictionary: (NSDictionary<NSString *, NSString *> *)dictionary;


@end

NS_ASSUME_NONNULL_END
