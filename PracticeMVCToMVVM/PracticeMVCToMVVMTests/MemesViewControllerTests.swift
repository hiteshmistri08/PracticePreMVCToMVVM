//
//  MemesViewControllerTests.swift
//  PracticeMVCToMVVMTests
//
//  Created by Hitesh on 11/05/22.
//

import XCTest
@testable import PracticeMVCToMVVM

class MemesViewControllerTests: XCTestCase {
    
    func test_canInit() throws {
        let bundle = Bundle(for: AppDelegate.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)
        
        let initialVC = sb.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        _ = try XCTUnwrap(navigation.topViewController as? MemesViewController)
    }
    
    func test_viewDidLoad_setTitle() throws {
        let bundle = Bundle(for: AppDelegate.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)
        
        let initialVC = sb.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        let sut = try XCTUnwrap(navigation.topViewController as? MemesViewController)

        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, "Memes")
    }
}
