//
//  main.m
//  simple
//
//  Created by Nadiar Syaripul on 21/11/20.
//

#import <Foundation/Foundation.h>
#import "MyTime.h"
// #import "MyTime.m"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    MyTime *myTime = [[MyTime alloc]init];
    long s = [myTime secondsSinceMidnight];
    myTime.month = 10;
    int x = 12;
    int *y = &x;
    
    printf("Month %d \n", myTime.month);
    printf("x %d y %p &y %p (*y) %d \n", x, y, &y, (*y));
    printf("S %ld \n", s);
    return 0;
}
