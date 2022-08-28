//
//  __TextField_ile_PickerView_kullanimiUITestsLaunchTests.swift
//  4-TextField ile PickerView kullanimiUITests
//
//  Created by Furkan on 23.08.2022.
//

import XCTest

class __TextField_ile_PickerView_kullanimiUITestsLaunchTests: XCTestCase {

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
