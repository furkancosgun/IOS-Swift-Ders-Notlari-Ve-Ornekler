//
//  __Kod_ile_Gecis_tetiklemeUITestsLaunchTests.swift
//  7-Kod ile Gecis tetiklemeUITests
//
//  Created by Furkan on 18.08.2022.
//

import XCTest

class __Kod_ile_Gecis_tetiklemeUITestsLaunchTests: XCTestCase {

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
