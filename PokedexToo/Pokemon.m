//
//  Pokemon.m
//  PokedexToo
//
//  Created by Jeremy Warren on 10/1/21.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)initWithName:(NSString *)name num:(NSInteger)num spriteURL:(NSURL *)spriteURL {
    self = [super init];
    if (self) {
        
        _name = name;
        _num = num;
        _spriteURL = spriteURL;
    }
    
    
    return self;
}
@end
