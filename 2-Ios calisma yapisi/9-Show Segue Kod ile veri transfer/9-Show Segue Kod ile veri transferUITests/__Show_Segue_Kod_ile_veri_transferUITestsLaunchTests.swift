//
//  __Show_Segue_Kod_ile_veri_transferUITestsLaunchTests.swift
//  9-Show Segue Kod ile veri transferUITests
//
//  Created by Furkan on 19.08.2022.
//

import XCTest

class __Show_Segue_Kod_ile_veri_transferUITestsLaunchTests: XCTestCase {

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
