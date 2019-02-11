//
//  SDLOnAppServiceDataSpec.m
//  SmartDeviceLinkTests
//
//  Created by Nicole on 2/7/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLOnAppServiceData.h"
#import "SDLNames.h"

QuickSpecBegin(SDLOnAppServiceDataSpec)

describe(@"Getter/Setter Tests", ^{
    __block SDLAppServiceData *testAppServiceData = nil;

    beforeEach(^{
        testAppServiceData = [[SDLAppServiceData alloc] init];
        testAppServiceData.serviceId = @"testServiceId";
    });

    it(@"Should set and get correctly", ^{
        SDLOnAppServiceData *testNotification = [[SDLOnAppServiceData alloc] init];
        testNotification.serviceData = testAppServiceData;

        expect(testNotification.serviceData).to(equal(testAppServiceData));
    });

    it(@"Should get correctly when initialized with a dictionary", ^{
        NSDictionary *dict = @{SDLNameNotification:@{
                                       SDLNameParameters:@{
                                               SDLNameServiceData:testAppServiceData
                                               },
                                       SDLNameOperationName:SDLNameOnAppServiceData}};
        SDLOnAppServiceData *testNotification = [[SDLOnAppServiceData alloc] initWithDictionary:dict];

        expect(testNotification.serviceData).to(equal(testAppServiceData));
    });

    it(@"Should return nil if not set", ^{
        SDLOnAppServiceData *testNotification = [[SDLOnAppServiceData alloc] init];

        expect(testNotification.serviceData).to(beNil());
    });
});

QuickSpecEnd

