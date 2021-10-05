//
//  Pokemon.h
//  PokedexToo
//
//  Created by Jeremy Warren on 10/1/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

@property NSString *name;
@property NSInteger num;
@property NSURL *spriteURL;

- (instancetype) initWithName:(NSString *)name
                          num:(NSInteger)num
                    spriteURL:(NSURL *)spriteURL;

@end

NS_ASSUME_NONNULL_END
