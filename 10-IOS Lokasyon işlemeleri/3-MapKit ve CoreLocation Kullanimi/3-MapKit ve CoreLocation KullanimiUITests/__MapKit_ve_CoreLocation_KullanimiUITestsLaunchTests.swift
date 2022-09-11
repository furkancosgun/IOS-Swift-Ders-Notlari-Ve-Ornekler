//
//  __MapKit_ve_CoreLocation_KullanimiUITestsLaunchTests.swift
//  3-MapKit ve CoreLocation KullanimiUITests
//
//  Created by Furkan on 11.09.2022.
//

import XCTest

class __MapKit_ve_CoreLocation_KullanimiUITestsLaunchTests: XCTestCase {

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
