//
//  SickerBrowserViewController.h
//  amsStickies
//
//  Created by Engel Alipio on 9/11/16.
//  Copyright © 2017 Agile Mobile Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Messages/Messages.h>

@interface StickerBrowserViewController : MSStickerBrowserViewController

-(void) changeBackGroundColor: (UIColor*) anyColor;
-(void) loadStickers;
@end
