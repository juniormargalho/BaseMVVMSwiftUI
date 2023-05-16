//
//  LoginTests.swift
//  BaseMVVMSwiftUITests
//
//  Created by Junior Margalho on 16/05/23.
//

@testable import BaseMVVMSwiftUI
import XCTest

final class LoginTests: XCTestCase {
    private var loginServiceSpy = LoginServiceSpy()
    private var sut: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        sut = LoginViewModel(service: loginServiceSpy)
    }
    
    func testDefaultInitialState() {
        XCTAssertEqual(sut.state, LoginViewState(isLoading: false,
                                                 hasError: false,
                                                 errorMessage: "",
                                                 userEmail: "",
                                                 userPassword: "",
                                                 userName: "",
                                                 userAvatar: "" ))
    }
    
    func testDisabledButton() {
        XCTAssertTrue(sut.isDisabledButton())
    }
    
    func testEnabledButton() {
        sut.userEmailBinding.wrappedValue = "x"
        sut.userPasswordBinding.wrappedValue = "x"
        XCTAssertFalse(sut.isDisabledButton())
    }
    
    func testLoginShouldCalled() {
        loginServiceSpy.performRequestCalled = false
        sut.login()
        XCTAssertEqual(loginServiceSpy.performRequestCalled, true)
    }
    
    func testLoginShouldCalledOnce() {
        loginServiceSpy.performRequestCount = 0
        sut.login()
        XCTAssertEqual(loginServiceSpy.performRequestCount, 1)
    }
    
    func testLoginSuccess() {
        loginServiceSpy.modelToBeReturned = LoginResponseModel(userName: "Usuário")
        sut.login()
        XCTAssertEqual(sut.state.userName, "Usuário")
    }
}
