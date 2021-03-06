//  SDLTurn.h
//

#import "SDLRPCMessage.h"

@class SDLImage;

NS_ASSUME_NONNULL_BEGIN

/**
 A struct used in UpdateTurnList for Turn-by-Turn navigation applications
 */
@interface SDLTurn : SDLRPCStruct

- (instancetype)initWithNavigationText:(nullable NSString *)navigationText turnIcon:(nullable SDLImage *)icon;

/**
 Individual turn text. Must provide at least text or icon for a given turn
 */
@property (strong, nonatomic, nullable) NSString *navigationText;

/**
 Individual turn icon. Must provide at least text or icon for a given turn
 */
@property (strong, nonatomic, nullable) SDLImage *turnIcon;

@end

NS_ASSUME_NONNULL_END
