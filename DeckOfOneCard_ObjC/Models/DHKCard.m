//
//  DHKCard.m
//  DeckOfOneCard_ObjC
//
//  Created by Dustin Koch on 5/21/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import "DHKCard.h"

@implementation DHKCard

- (instancetype) initWithSuit:(NSString *)suit url:(NSString *)imageUrl code:(NSString *)code
{
    self = [super init];
    if (self) {
        _suit = suit;
        _imageUrl = imageUrl;
        _code = code;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,NSString *> *)dictionary
{
    //1 Pull necessary info
    NSString *suit = dictionary[@"suit"];
    NSString *url = dictionary[@"image"];
    NSString *code = dictionary[@"code"];

    //2 call memberwise init
    return [self initWithSuit:suit url:url code:code];
}

@end
