//
//  _5_TabBar_ve_navigation_birlikteUITestsLaunchTests.swift
//  15-TabBar ve navigation birlikteUITests
//
//  Created by Furkan on 20.08.2022.
//

import XCTest

class _5_TabBar_ve_navigation_birlikteUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
