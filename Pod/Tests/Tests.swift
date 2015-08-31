import UIKit
import XCTest

class Tests: XCTestCase {

  func testCreate() {
    Notification.create("", seconds: 1, soundName: "", message: "", actionTitle: "")
  }
}
