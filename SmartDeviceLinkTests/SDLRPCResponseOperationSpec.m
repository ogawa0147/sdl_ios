//
//  SDLRPCResponseOperationSpec.m
//  SmartDeviceLinkTests
//
//  Created by Nicole on 2/20/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLGetAppServiceDataResponse.h"
#import "SDLOnAppServiceData.h"
#import "SDLRPCResponseOperation.h"
#import "TestConnectionManager.h"

QuickSpecBegin(SDLRPCResponseOperationSpec)

describe(@"sending responses and notifications", ^{
    __block TestConnectionManager *testConnectionManager = nil;
    __block SDLRPCResponseOperation *testOperation = nil;
    __block NSOperationQueue *testOperationQueue = nil;

    beforeEach(^{
        testOperation = nil;
        testConnectionManager = [[TestConnectionManager alloc] init];

        testOperationQueue = [[NSOperationQueue alloc] init];
        testOperationQueue.name = @"com.sdl.RPCResponse.testqueue";
        testOperationQueue.maxConcurrentOperationCount = 3;
    });

    context(@"when a single request succeeds", ^{
        __block __kindof SDLRPCMessage *sendRPC = nil;

        beforeEach(^{
            sendRPC = [[SDLGetAppServiceDataResponse alloc] initWithAppServiceData:[[SDLAppServiceData alloc] init]];
        });

        it(@"should correctly send the rpc", ^{
            testOperation = [[SDLRPCResponseOperation alloc] initWithConnectionManager:testConnectionManager rpc:sendRPC];

            [testOperationQueue addOperation:testOperation];
            [NSThread sleepForTimeInterval:0.1];

            expect(testConnectionManager.receivedRequests).toEventually(contain(sendRPC));
        });
    });

    context(@"when multiple request succeed", ^{
        __block NSMutableArray< __kindof SDLRPCMessage *> *sendRPCs = nil;
        __block int rpcCount = (int)testOperationQueue.maxConcurrentOperationCount + 3;

        beforeEach(^{
            sendRPCs = [NSMutableArray array];
            for (int i = 0; i < rpcCount; i += 1) {
                [sendRPCs addObject:[[SDLGetAppServiceDataResponse alloc] initWithAppServiceData:[[SDLAppServiceData alloc] init]]];
            }
        });

        it(@"should correctly send all of the rpcs", ^{
            for (int i = 0; i < rpcCount; i += 1) {
                testOperation = [[SDLRPCResponseOperation alloc] initWithConnectionManager:testConnectionManager rpc:sendRPCs[i]];
                [testOperationQueue addOperation:testOperation];
            }

            [NSThread sleepForTimeInterval:0.1];

            expect(testConnectionManager.receivedRequests.count).toEventually(equal(rpcCount));
            expect(testConnectionManager.receivedRequests).toEventually(equal(sendRPCs));
        });
    });

    context(@"when a requst is cancelled", ^{
        __block __kindof SDLRPCMessage *sendRPC = nil;

        beforeEach(^{
            sendRPC = [[SDLGetAppServiceDataResponse alloc] initWithAppServiceData:[[SDLAppServiceData alloc] init]];
        });

        it(@"should not send the rpc", ^{
            testOperation = [[SDLRPCResponseOperation alloc] initWithConnectionManager:testConnectionManager rpc:sendRPC];

            [testOperationQueue addOperation:testOperation];
            [testOperationQueue cancelAllOperations];

            [NSThread sleepForTimeInterval:0.1];

            expect(testConnectionManager.receivedRequests).toEventually(beEmpty());
        });
    });
});

QuickSpecEnd
