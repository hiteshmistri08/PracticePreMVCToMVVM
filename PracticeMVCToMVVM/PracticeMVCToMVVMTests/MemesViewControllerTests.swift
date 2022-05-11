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
        _ = try makeSUT()
    }
    
    func test_viewDidLoad_setTitle() throws {
        let sut = try makeSUT()

        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, "Memes")
    }
    
    func test_viewDidLoad_configureTableView() throws {
        let sut = try makeSUT()

        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView.dataSource, "data source")
    }
    
    //MARK: - Helpers
    
    private func makeSUT() throws -> MemesViewController {
        let bundle = Bundle(for: AppDelegate.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)
        
        let initialVC = sb.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)

        return try XCTUnwrap(navigation.topViewController as? MemesViewController)
    }
}
