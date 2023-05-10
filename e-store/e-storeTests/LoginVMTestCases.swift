//
//  e_storeTests.swift
//  e-storeTests
//
//  Created by Zeyad on 25/03/2023.
//

import XCTest

@testable import e_store
final class LoginVMTestCases: XCTestCase {

    var sut: LoginViewModel!
    
    override func setUpWithError() throws {
        sut = LoginViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_check_config_button_when_email_is_not_empty_and_password_is_not_empty_it_should_be_enabled() {
        // Given
        var isEnable : Bool?
        sut.checkConfigButton{isenable in
            isEnable = isenable
        }
        // When
        sut.updateUsername(email: "aaaa")
        sut.updatePassword(password: "aaaa1223")
        // Then
        XCTAssertTrue(isEnable ?? false)
    }
    
    func test_check_config_button_when_email_is_not_empty_and_password_is_empty_it_should_be_disabled() {
        // Given
        var isEnable : Bool?
        sut.checkConfigButton{isenable in
            isEnable = isenable
        }
        // When
        sut.updateUsername(email: "aaa1212")
        sut.updatePassword(password: "")
        // Then
        XCTAssertFalse(isEnable ?? true)
    }
    
    func test_check_config_button_when_email_is_empty_and_password_is_not_empty_it_should_be_disabled() {
        // Given
        var isEnable : Bool?
        sut.checkConfigButton{isenable in
            isEnable = isenable
        }
        // When
        sut.updateUsername(email: "")
        sut.updatePassword(password: "aaaa1223")
        // Then
        XCTAssertFalse(isEnable ?? true)
    }

    func test_check_config_button_when_email_and_password_is_empty_it_should_be_disabled() {
        // Given
        var isEnable : Bool?
        sut.checkConfigButton{isenable in
            isEnable = isenable
        }
        // When
        sut.updateUsername(email: "")
        sut.updatePassword(password: "")
        // Then
        XCTAssertFalse(isEnable ?? true)
    }

}
