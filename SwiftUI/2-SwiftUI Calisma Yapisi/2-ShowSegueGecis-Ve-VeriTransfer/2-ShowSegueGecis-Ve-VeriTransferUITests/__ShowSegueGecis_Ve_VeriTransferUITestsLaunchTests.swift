//
//  __ShowSegueGecis_Ve_VeriTransferUITestsLaunchTests.swift
//  2-ShowSegueGecis-Ve-VeriTransferUITests
//
//  Created by Furkan on 28.09.2022.
//

import XCTest

final class __ShowSegueGecis_Ve_VeriTransferUITestsLaunchTests: XCTestCase {

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
