//
//  SDLGetAppServiceData.h
//  SmartDeviceLink
//
//  Created by Nicole on 2/6/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLRPCRequest.h"
#import "SDLAppServiceType.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  This request asks the module for current data related to the specific service. It also includes an option to subscribe to that service for future updates.
 */
@interface SDLGetAppServiceData : SDLRPCRequest

/**
 *  Convenience init.
 *
 *  @param serviceType      The app service type
 *  @param subscribe        Whether or not to subcribe to updates
 *  @return                 A SDLGetAppServiceData object
 */
- (instancetype)initWithServiceType:(SDLAppServiceType)serviceType subscribe:(BOOL)subscribe;

/**
 *  The app service type
 *
 *  SDLAppServiceType, Required
 */
@property (strong, nonatomic) SDLAppServiceType serviceType;

/**
 *  If true, the consumer is requesting to subscribe to all future updates from the service publisher. If false, the consumer doesn't wish to subscribe and should be unsubscribed if it was previously subscribed.
 *
 *  Boolean, Optional
 */
@property (nullable, strong, nonatomic) NSNumber<SDLBool> *subscribe;

@end

NS_ASSUME_NONNULL_END