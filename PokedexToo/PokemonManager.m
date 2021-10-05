//
//  PokemonManager.m
//  PokedexToo
//
//  Created by Jeremy Warren on 10/2/21.
//

#import "PokemonManager.h"

@implementation PokemonManager

+ (void)fetchPokemonWithName:(NSString *)name completion:(void (^)(Pokemon *))completion {
    NSURL *baseURL = [NSURL URLWithString:@"https://pokeapi.co/api/v2/pokemon/"];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:[name lowercaseString]];
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            completion(NULL);
            return;
        }
        
        if (!data) {
            completion(NULL);
            return;
        }
    
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSString *name = json[@"name"];
        NSInteger num = [json[@"id"] integerValue];
        
        NSDictionary *sprites = json[@"sprites"];
        NSURL *image = [NSURL URLWithString:sprites[@"front_default"]];
        
        Pokemon *pokemon = [[Pokemon alloc] initWithName:name num:num spriteURL:image];
        
        completion(pokemon);
        
    }] resume];
    
}


+ (void)fetchSpriteForPokemon:(Pokemon *)pokemon completion:(void (^)(UIImage *))completion {
    [[NSURLSession.sharedSession dataTaskWithURL:pokemon.spriteURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // error
        if (error) {
            NSLog(@"%@", error);
            completion(NULL);
            return;
        }
        
        // data
        if (!data) {
            completion(NULL);
            return;
        }
        
        UIImage *sprite = [UIImage imageWithData:data];
        completion(sprite);
    }] resume];
}
@end
