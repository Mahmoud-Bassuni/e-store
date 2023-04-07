//
//  ValidatorTestCases.swift
//  e-storeTests
//
//  Created by Zeyad on 06/04/2023.
//

import XCTest

@testable import e_store
final class ValidatorTestCases: XCTestCase {
    
    var sut : LoginViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
//test_check_config_button_when_email_is_not_empty_and_password_is_not_empty_it_should_be_enabled()
    func test_validUsername_func_when_username_is_valid() {
        //requires to contain at least 3 elements(1 uppercase, 1 lowercase and 1 number)
        var validUsername:Bool? = sut.validUsername("zeyadSultan1")
        XCTAssertTrue(validUsername ?? false)
    }
    
    func test_validUsername_func_when_username_is_invalid() {
        //requires to contain at least 3 elements(1 uppercase, 1 lowercase and 1 number)
        var validUsername:Bool? = sut.validUsername("zeyadsultan1")
        XCTAssertFalse(validUsername ?? true)
    }

    func test_validPassword_func_when_password_is_valid() {
        // Check that the password is at least 6 characters long with at least one letter and one number
        var validPassword:Bool? = sut.validPassword("12345a")
        XCTAssertTrue(validPassword ?? false)
    }
    
    func test_validPassword_func_when_password_is_invalid() {
        // Check that the password is at least 6 characters long with at least one letter and one number
        var validPassword:Bool? = sut.validPassword("123456")
        XCTAssertFalse(validPassword ?? true)
    }

}
