//
//  LoginViewModelTests.swift
//  NetworkingTests
//
//  Created by Mindaugas Balakauskas on 29/09/2022.
//

import XCTest
@testable import Networking

class LoginViewModelTests: XCTestCase {
    
    let viewModel = LoginViewModel()

    override func setUpWithError() throws {
     
    }

    override func tearDownWithError() throws {
     
    }
    
    func testValidCredentials() {
        let userName = "1"
        let password = "1"
        let expectedOutput = ""
        let actualOutput = viewModel.validate(username: userName, password: password)
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    func testInvalidUser () {
        let userName = "John"
        let password = "1"
        let expectedOutput = "Usrname is invalid."
        let actualOutput = viewModel.validate(username: userName, password: password)
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    func testInvalidPassword () {
        let userName = "1"
        let password = "12345"
        let expectedOutput = "Pasword is invalid."
        let actualOutput = viewModel.validate(username: userName, password: password)
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    func testEmptyUserName () {
        let userName = ""
        let password = "1"
        let expectedOutput = "Please enter your credentials."
        let actualOutput = viewModel.validate(username: userName, password: password)
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    func testEmptyPassword () {
        let userName = "1"
        let password = ""
        let expectedOutput = "Please enter your credentials."
        let actualOutput = viewModel.validate(username: userName, password: password)
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    func testEmptyUserNameAndPassword () {
        let userName = ""
        let password = ""
        let expectedOutput = "Please enter your credentials."
        let actualOutput = viewModel.validate(username: userName, password: password)
        XCTAssertEqual(expectedOutput, actualOutput)
    }
}
