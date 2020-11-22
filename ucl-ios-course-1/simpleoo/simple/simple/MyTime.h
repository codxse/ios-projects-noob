//
//  MyTime.h
//  simple
//
//  Created by Nadiar Syaripul on 21/11/20.
//
#import <Foundation/Foundation.h>
#ifndef MyTime_h
#define MyTime_h


#endif /* MyTime_h */

@interface MyTime : NSObject

@property (atomic) int year;
@property (atomic) int month;
@property (atomic) int day;
@property (atomic) int hour;
@property (atomic) int minutes;
@property (atomic) int seconds;

- (long) approxSecondsWhichYear:(long)whichYear;
- (long) approxSecondsSince1970;
- (long) secondsSinceMidnight;

@end
