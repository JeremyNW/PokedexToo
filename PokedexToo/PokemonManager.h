//
//  PokemonManager.h
//  PokedexToo
//
//  Created by Jeremy Warren on 10/2/21.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PokemonManager : NSObject

+ (void) fetchPokemonWithName:(NSString *)name completion:(void (^)(Pokemon *pokemon))completion;

+ (void) fetchSpriteForPokemon:(Pokemon *)pokemon completion:(void (^) (UIImage *image))completion;
 
@end

NS_ASSUME_NONNULL_END
