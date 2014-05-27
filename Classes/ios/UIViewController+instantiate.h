//
//  UIViewController+instantiate.h
//  PandaDoc
//
//  Created by orkenstein on 26.03.14.
//  Copyright (c) 2014 PandaDoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Storyboard)

//  Call from any VC to instantiate for concrete identifier
+ (instancetype)instantiateWithIdentifier:(NSString *)identifier;
//  Call for a VC subclass to instantiate from storyboards with identifier equal
//  to the class name (Example: Storyboard ID equal "LoginViewController")
+ (instancetype)instantiateFromStoryboard;

@end
