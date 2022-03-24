//
//  HomeViewModelTests.swift
//  DeviceManagerTests
//
//  Created by Thejus Thejus on 23/03/2022.
//

import XCTest
@testable import DeviceManager

class HomeViewModelTests: XCTestCase {
    
    let engine: Engine = TestUtils.engine
    lazy var viewModel = HomeViewModel(engine: engine)
    
    // Test loading all devices from viewmodel
    func testGetAllDevices() {
        let expectation = self.expectation(description: "testGetAllDevices")
        viewModel.getAllDevices { [weak self] result in
            switch result {
            case .success:
                XCTAssertFalse(self?.viewModel.allDevices.isEmpty ?? true)
            case .failure:
                // Failed to load mocked data
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPaginationLoad() {
        loadMore()
    }
    
    private func loadMore() {
        if viewModel.allDevices.count > viewModel.allDisplayableDevices.count {
            viewModel.loadMoreDisplayableDevices { [weak self] _ in
                XCTAssertTrue(
                    self?.viewModel.allDisplayableDevices.count ?? 0 > HomeViewModel.kPageSize
                )
            }
        } else {
            XCTAssertEqual(viewModel.allDisplayableDevices, viewModel.allDevices)
        }
    }
}
