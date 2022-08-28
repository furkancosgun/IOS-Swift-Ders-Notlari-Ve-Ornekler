//
//  __Nesneleri_sinifa_baglamaUITestsLaunchTests.swift
//  2-Nesneleri sinifa baglamaUITests
//
//  Created by Furkan on 17.08.2022.
//

import XCTest

class __Nesneleri_sinifa_baglamaUITestsLaunchTests: XCTestCase {

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
