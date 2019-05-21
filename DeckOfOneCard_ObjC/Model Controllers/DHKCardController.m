//
//  DHKCardController.m
//  DeckOfOneCard_ObjC
//
//  Created by Dustin Koch on 5/21/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

#import "DHKCardController.h"

@implementation DHKCardController

- (void)fetchCardWithCompletion:(void (^)(DHKCard * _Nullable card))completion
{
    //CONSTRUCT URL
    NSURL *baseURL = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/"];
    NSURL *biggerUrl = [[baseURL URLByAppendingPathComponent:@"new"] URLByAppendingPathComponent:@"draw"];
    NSURLComponents *components = [NSURLComponents componentsWithURL:biggerUrl resolvingAgainstBaseURL:TRUE];
    NSURLQueryItem *countQuery = [[NSURLQueryItem alloc] initWithName:@"count" value:@"1"];
    components.queryItems = @[countQuery];
    NSURL *finalURL = components.URL;
    NSLog(finalURL.absoluteString);
    //DATA TASK and COMPLETION
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data) {
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *cardArray = jsonDictionary[@"cards"];
            for (NSDictionary *cardDictionary in cardArray) {
                DHKCard *card = [[DHKCard alloc] initWithDictionary:cardDictionary];
                completion(card);
            }
        }
        completion(nil);
    }] resume]; 
}

@end
