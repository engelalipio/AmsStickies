//
//  SickerBrowserViewController.m
//  amsStickies
//
//  Created by Engel Alipio on 9/11/16.
//  Copyright © 2017 Agile Mobile Solutions. All rights reserved.
//

#import "StickerBrowserViewController.h"

@interface StickerBrowserViewController(){
    NSMutableArray *stickers ;
}
-(void) logMethodName : (NSString *) anyMethod;
-(void) createSticker:(NSString *) anyAsset withAnyLanguage :(NSString*) anyLanguage;
@end

@implementation StickerBrowserViewController

-(void) changeBackGroundColor: (UIColor*) anyColor{
    [self.stickerBrowserView setBackgroundColor:anyColor];
 
}

-(void) logMethodName : (NSString *) anyMethod{
    NSString *message = @"";
    @try {
        message = @"didBecomeActiveWithConversation invoked";
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = @"";
    }
}

-(void) loadStickers{
    
    [self createSticker:@"AMSSquare" withAnyLanguage:@"SquareBlack"];
    
    [self createSticker:@"AMSSquareWhite" withAnyLanguage:@"SquareWhite"];
    
    [self createSticker:@"AMSRound" withAnyLanguage:@"RoundBlack"];
    
    [self createSticker:@"AMSRoundWhite" withAnyLanguage:@"RoundWhite"];
    
    [self createSticker:@"AMSABS" withAnyLanguage:@"AbsBlack"];
    
    [self createSticker:@"AMSABSWhite" withAnyLanguage:@"AbsWhite"];
}

-(void) createSticker:(NSString *) anyAsset withAnyLanguage :(NSString*) anyLanguage{
    
    NSString *stickerPath = @"";
    NSBundle *globalBundle = nil;
    NSURL *stickerURL = nil;
    MSSticker *sticker = nil;
    NSError *anyError = nil;
    @try {
        [self logMethodName:@"createSticker"];
        
      globalBundle = [NSBundle mainBundle];
        if (globalBundle){
            
            if (! stickers){
                stickers = [[NSMutableArray alloc] init];
            }
            
            stickerPath =  [globalBundle pathForResource:anyAsset ofType:@"png"];
            
            if (stickerPath.length > 0){
                stickerURL = [NSURL fileURLWithPath:stickerPath];
                
                if (stickerURL){
                    sticker = [[MSSticker alloc] initWithContentsOfFileURL:stickerURL
                                                      localizedDescription:anyLanguage
                                                                     error:&anyError];
                    
                    if (anyError){
                        NSLog(@"%@",anyError.description);
                    }
                    
                    if (! [stickers containsObject:sticker]){
                        [stickers addObject:sticker];
                    }
                    
                }
            }
        }
    
    } @catch (NSException *exception) {
        NSLog(@"%@",exception.description);
    } @finally {
        stickerPath = @"";
        globalBundle = nil;
        stickerURL = nil;
    }
}

-(NSInteger) numberOfStickersInStickerBrowserView:(MSStickerBrowserView *)stickerBrowserView{
    NSInteger stickerCount = 0;
    
    @try {
        
        [self logMethodName: @"numberOfStickersInStickerBrowserView" ];
        
        stickerCount = [stickers count];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception.description);
    } @finally {
        
    }
    
    return stickerCount;
}

-(MSSticker*) stickerBrowserView:(MSStickerBrowserView *)stickerBrowserView stickerAtIndex:(NSInteger)index{
    
    MSSticker *sticker = nil;
    
    @try {
        
        [self logMethodName: @"numberOfStickersInStickerBrowserView" ];
        
        sticker = [stickers objectAtIndex:index];
        
    } @catch (NSException *exception) {
        NSLog(@"%@",exception.description);
    } @finally {
        
    }
    
    return sticker;
}

@end
