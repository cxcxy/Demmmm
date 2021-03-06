// swiftlint:disable type_name

import Foundation

struct Config {

    struct UI {
        /// Gank‘s ThemeColor
        static let themeColor = UIColor(r: 63.0, g: 63.0, b: 63.0, a: 1)
        /// Gank's Navgation Title Color
        static let titleColor = UIColor(r: 255, g: 255, b: 255, a: 1)
    }
}

extension Notification.Name {
    /// Gank post when home category change
    static let category = Notification.Name(rawValue: "homeCategory")
}
