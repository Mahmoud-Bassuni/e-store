//
//  ValidatorTestCases.swift
//  e-storeTests
//
//  Created by Zeyad on 06/04/2023.
//

import XCTest

@testable import e_store
final class ValidatorTestCases: XCTestCase {
    

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_validUsername_func_when_username_is_valid() {
        var validUsername:Bool? = Validator.isValidUsername(username: "zeyadSultan1")
        XCTAssertTrue(validUsername ?? false)
    }
    
    func test_validUsername_func_when_username_is_invalid() {
        var validUsername:Bool? = Validator.isValidUsername(username: "zeyadsultan1")
        XCTAssertFalse(validUsername ?? true)
    }

    func test_validPassword_func_when_password_is_valid() {
        var validPassword:Bool? = Validator.isValidPassword(password: "12345a")
        XCTAssertTrue(validPassword ?? false)
    }
    
    func test_validPassword_func_when_password_is_invalid() {
        var validPassword:Bool? = Validator.isValidPassword(password: "123456")
        XCTAssertFalse(validPassword ?? true)
    }

}
