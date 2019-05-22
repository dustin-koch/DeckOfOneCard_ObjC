//
//  DHKCardController.h
//  DeckOfOneCard_ObjC
//
//  Created by Dustin Koch on 5/21/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHKCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface DHKCardController : NSObject

- (void) fetchCardWithCompletion:(void (^) (DHKCard * _Nullable card))completion;

- (void) fetchImageFrom:(DHKCard *)card completion:(void (^) (UIImage * _Nullable image)) completion;

@end

NS_ASSUME_NONNULL_END
