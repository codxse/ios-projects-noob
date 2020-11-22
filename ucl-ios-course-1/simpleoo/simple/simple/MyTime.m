//
//  MyTime.m
//  simple
//
//  Created by Nadiar Syaripul on 22/11/20.
//
#import <Foundation/Foundation.h>
#import "MyTime.h"

@implementation MyTime

- (long) approxSecondsWhichYear:(long)whichYear {
    long allSec = 0;
    allSec = self.seconds;
    allSec = allSec + self.minutes * 60;
    allSec = allSec + self.hour * 60 * 60;
    allSec = allSec + self.day * 60 * 60 * 24;
    allSec = allSec + self.month * 60 * 60 * 24 * 30;
    allSec = allSec + (self.year - whichYear) * 60 * 60 * 24 * 30 * 365;
    return (allSec);
}

- (long) approxSecondsSince1970 {
    return [self approxSecondsWhichYear:1970];
}

- (long) secondsSinceMidnight {
    return 0.0;
}

@end
