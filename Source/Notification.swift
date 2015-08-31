import UIKit

public struct Notification {
    static let IDKey = "IDKey"
    static let FireDateKey = "FireDateKey"

    public static func create(id: String, fireDate: NSDate, soundName: String? = nil, message: String, actionTitle: String? = nil) {
        let notification = UILocalNotification()
        notification.soundName = soundName

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
        notification.userInfo = userInfo

        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

    public static func find(id: String) -> UILocalNotification? {
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

    public static func delete(id: String) {
        if let notification = find(id) {
            UIApplication.sharedApplication().cancelLocalNotification(notification)
        }
    }
}
