//
//  CityListDispalyTests.swift
//  CityListDispalyTests
//
//  Created by Richa Agrawal on 23/02/25.
//

import Testing
import XCTest
@testable import CityListDispaly

struct CityListDispalyTests {
    var viewModel = CitiesViewModel()
    
    @Test func testGetCitiesFunction() {
        viewModel.getCity()
        XCTAssertEqual(viewModel.citiesList.count, 323)
        viewModel.citiesList.removeLast()
        XCTAssertEqual(viewModel.citiesList.count, 322)
        viewModel.citiesList.removeAll()
        XCTAssertEqual(viewModel.citiesList.count, 0)
    }
    
    @Test func filterCitiesList() {
        viewModel.filteCitiesList(isReversed: false)
        XCTAssertEqual(viewModel.listArray.count, 8)
        XCTAssertEqual(viewModel.listArray.first?.isExpand, false)
        XCTAssertEqual(viewModel.listArray.first?.index, 0)
    }

}
