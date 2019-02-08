//
//  SDLWeatherServiceManifestSpec.m
//  SmartDeviceLinkTests
//
//  Created by Nicole on 2/8/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLNames.h"
#import "SDLWeatherServiceManifest.h"

QuickSpecBegin(SDLWeatherServiceManifestSpec)

describe(@"Getter/Setter Tests", ^{
    __block BOOL testCurrentForecastSupported = nil;
    __block int testMaxMultidayForecastAmount = 3;
    __block int testMaxHourlyForecastAmount = 78;
    __block int testMaxMinutelyForecastAmount = 13;
    __block BOOL testWeatherForLocationSupported = nil;

    beforeEach(^{
        testCurrentForecastSupported = false;
        testCurrentForecastSupported = true;
    });

    it(@"Should set and get correctly", ^{
        SDLWeatherServiceManifest *testStruct = [[SDLWeatherServiceManifest alloc] init];
        testStruct.currentForecastSupported = @(testCurrentForecastSupported);
        testStruct.maxMultidayForecastAmount = @(testMaxMultidayForecastAmount);
        testStruct.maxHourlyForecastAmount = @(testMaxHourlyForecastAmount);
        testStruct.maxMinutelyForecastAmount = @(testMaxMinutelyForecastAmount);
        testStruct.weatherForLocationSupported = @(testWeatherForLocationSupported);

        expect(testStruct.currentForecastSupported).to(equal(testCurrentForecastSupported));
        expect(testStruct.maxMultidayForecastAmount).to(equal(testMaxMultidayForecastAmount));
        expect(testStruct.maxHourlyForecastAmount).to(equal(testMaxHourlyForecastAmount));
        expect(testStruct.maxMinutelyForecastAmount).to(equal(testMaxMinutelyForecastAmount));
        expect(testStruct.weatherForLocationSupported).to(equal(testWeatherForLocationSupported));
    });

    it(@"Should get correctly when initialized with a dictionary", ^{
        NSDictionary *dict = @{SDLNameCurrentForecastSupported:@(testCurrentForecastSupported),
                               SDLNameMaxMultidayForecastAmount:@(testMaxMultidayForecastAmount),
                               SDLNameMaxHourlyForecastAmount:@(testMaxHourlyForecastAmount),
                               SDLNameMaxMinutelyForecastAmount:@(testMaxMinutelyForecastAmount),
                               SDLNameWeatherForLocationSupported:@(testWeatherForLocationSupported)
                               };
        SDLWeatherServiceManifest *testStruct = [[SDLWeatherServiceManifest alloc] initWithDictionary:dict];

        expect(testStruct.currentForecastSupported).to(equal(testCurrentForecastSupported));
        expect(testStruct.maxMultidayForecastAmount).to(equal(testMaxMultidayForecastAmount));
        expect(testStruct.maxHourlyForecastAmount).to(equal(testMaxHourlyForecastAmount));
        expect(testStruct.maxMinutelyForecastAmount).to(equal(testMaxMinutelyForecastAmount));
        expect(testStruct.weatherForLocationSupported).to(equal(testWeatherForLocationSupported));
    });

    it(@"Should return nil if not set", ^{
        SDLWeatherServiceManifest *testStruct = [[SDLWeatherServiceManifest alloc] init];

        expect(testStruct.currentForecastSupported).to(beNil());
        expect(testStruct.maxMultidayForecastAmount).to(beNil());
        expect(testStruct.maxHourlyForecastAmount).to(beNil());
        expect(testStruct.maxMinutelyForecastAmount).to(beNil());
        expect(testStruct.weatherForLocationSupported).to(beNil());
    });
});

QuickSpecEnd

