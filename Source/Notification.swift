import UIKit

public struct Notification {
    static let IDKey = "IDKey"
    static let FireDateKey = "FireDateKey"
    static let FireIntervalKey = "FireIntervalKey"

    public static func create(id: String, seconds: Int, soundName: String? = nil, message: String, actionTitle: String? = nil) {
        let notification = UILocalNotification()
        notification.soundName = soundName

        let fireDate = NSDate().dateByAddingTimeInterval(NSTimeInterval(seconds))
        notification.fireDate = fireDate
        notification.timeZone = NSTimeZone.defaultTimeZone()
        notification.alertBody = message
        notification.alertAction = actionTitle
        if actionTitle == nil {
            notification.hasAction = false
        }

        var userInfo = [NSObject : AnyObject]()
        userInfo[Notification.IDKey] = id
        userInfo[Notification.FireDateKey] = NSDate()
        userInfo[Notification.FireIntervalKey] = seconds
        notification.userInfo = userInfo

        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

    public func find(id: String) -> UILocalNotification? {
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications as! [UILocalNotification] {
            if let userInfo = notification.userInfo {
                if let key = userInfo[Notification.IDKey] as? String {
                    if key == id {
                        return notification
                    }
                }
            }
        }

        return nil
    }

    public func delete(id: String) {
        if let notification = find(id) {
            UIApplication.sharedApplication().cancelLocalNotification(notification)
        }
    }
}
