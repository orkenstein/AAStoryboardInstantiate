//
//  UIViewController+instantiate.m
//  PandaDoc
//
//  Created by orkenstein on 26.03.14.
//  Copyright (c) 2014 PandaDoc. All rights reserved.
//

#import "UIViewController+instantiate.h"

static NSMutableDictionary *ControllerToStoryboardMapDictionary = nil;

@implementation UIViewController (Storyboard)

#pragma mark - Instantiation

+ (instancetype)instantiateWithIdentifier:(NSString *)identifier {

    UIViewController *vc = nil;

    NSString *storyboardName = [self storyboardForContollerID:identifier];
    if (storyboardName != nil) {
        //  existance in storyboard guaranteed
        vc = [[UIStoryboard storyboardWithName:storyboardName
                                        bundle:nil]
            instantiateViewControllerWithIdentifier:identifier];

        return vc;
    }

    //  Search for VC in storyboards
    for (NSString *storyboardName in [self allStoryboardsNames]) {
        @try {
            vc = [[UIStoryboard storyboardWithName:storyboardName
                                            bundle:nil]
                instantiateViewControllerWithIdentifier:identifier];
            if (vc != nil) {
                //  Store
                [self mapContollerID:identifier
                    withStoryboardName:storyboardName];
                break;
            }
        }
        @catch (NSException *exception) {
          //  Do nothing
        }
    }

    if (vc == nil) {
        NSLog(@"VC instantiation: cannot find VC with ID %@", identifier);
    }
    
    return vc;
}

+ (instancetype)instantiateFromStoryboard {
    NSString *identifier = NSStringFromClass([self class]);
    return [self instantiateWithIdentifier:identifier];
}

#pragma mark - Internal Logic

+ (NSArray *)allStoryboardsNames {
    static NSArray *allStoryBoardsNamesArray = nil;

    if (allStoryBoardsNamesArray == nil) {
        NSArray *paths =
            [[NSBundle mainBundle] pathsForResourcesOfType:@"storyboardc"
                                               inDirectory:nil];

        NSMutableArray *allNamesMutable = [NSMutableArray array];

        for (NSString *path in paths) {
            NSString *name = [[path lastPathComponent] stringByDeletingPathExtension];
            [allNamesMutable addObject:name];
        }

        allStoryBoardsNamesArray = [allNamesMutable copy];
    }

    return allStoryBoardsNamesArray;
}

+ (NSString *)storyboardForContollerID:(NSString *)controllerID {
    return ControllerToStoryboardMapDictionary[controllerID];
}

+ (void)mapContollerID:(NSString *)controllerID
    withStoryboardName:(NSString *)storyboardName {
    if (ControllerToStoryboardMapDictionary == nil) {
        ControllerToStoryboardMapDictionary = [NSMutableDictionary dictionary];
    }
    ControllerToStoryboardMapDictionary[controllerID] = storyboardName;
}

@end
