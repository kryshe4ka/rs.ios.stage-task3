#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {

    switch (monthNumber) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter * RFC3339DateFormatter = [[NSDateFormatter alloc] init];
    RFC3339DateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";
            
    [dateFormatter setLocalizedDateFormatFromTemplate:@"dd"];
    NSDate *dateNew;
    
    if (date) {
        dateNew = [RFC3339DateFormatter dateFromString:date];
    } else {
        return 0;
    }
    if (dateNew) {
        NSString *str = [dateFormatter stringFromDate:dateNew];
        long res = [str longLongValue];
        return res;
    } else {
        return 0;
    }
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
        
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:date];
    
//    The weekday value for Sunday in the Gregorian calendar is 1
    long day = [weekdayComponents weekday];
    
    switch (day) {
        case 1:
            return @"Вс";
            break;
        case 2:
            return @"Пн";
            break;
        case 3:
            return @"Вт";
            break;
        case 4:
            return @"Ср";
            break;
        case 5:
            return @"Чт";
            break;
        case 6:
            return @"Пт";
            break;
        case 7:
            return @"Сб";
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    // The week in this case is defined as the period between Sunday at midnight to the following Saturday just before midnight (in the Gregorian calendar).
    
    NSDate *start;
    NSTimeInterval extends;
    NSDate *today = [NSDate date];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // чтобы неделя началь с понедельника а не с воскресенья
    calendar.firstWeekday = 2;
    
    // чтобы таймзона была как в минске
    [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3]];
    
    BOOL success = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&start interval:&extends forDate:today];
    if (!success) {
        return NO;
    }
    
    // + 10800 чтобы входная дата была в таймзоне минска
    NSTimeInterval dateInSecs = [date timeIntervalSinceReferenceDate] + 10800;
    NSLog(@"%f", dateInSecs);
    NSTimeInterval dayStartInSecs = [start timeIntervalSinceReferenceDate];
    
    return ((dateInSecs >= dayStartInSecs) && (dateInSecs < (dayStartInSecs + extends)));
}

@end
