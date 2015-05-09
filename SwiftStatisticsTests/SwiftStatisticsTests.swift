import UIKit
import XCTest
import SwiftStatistics

class SwiftStatisticsTests: XCTestCase {
  
  // MARK: - Min
  
  func testMin() {
    let result = Statistics.min([4, 2.1, 8])!
    XCTAssertEqual(2.1, result)
  }
  
  func testMin_whenEmpty() {
    let result = Statistics.min([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Max
  
  func testMax() {
    let result = Statistics.max([4, 15.1, 8])!
    XCTAssertEqual(15.1, result)
  }
  
  func testMax_whenEmpty() {
    let result = Statistics.max([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Sum
  
  func testSum() {
    let result = Statistics.sum([1, 3.1, 8])
    XCTAssertEqual(12.1, result)
  }
  
  func testSum_whenEmpty() {
    let result = Statistics.sum([])
    XCTAssertEqual(0, result)
  }
  
  // MARK: - Mean
  
  func testMean() {
    let result = Statistics.mean([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(6.4166666667, Helpers.round10(result))
  }
  
  func testAverage_whenEmpty() {
    let result = Statistics.mean([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Median
  
  func testMedian_oddNumberOfItems() {
    let result = Statistics.median([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedian_eventNumberOfItems() {
    let result = Statistics.median([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(5.5, result)
  }
  
  func testMedian_oneItem() {
    let result = Statistics.median([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedian_whenEmpty() {
    let result = Statistics.median([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Sample standard deviation
  
  func testSampleStandardDeviation() {
    let result = Statistics.sampleStandardDeviation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(8.6741954478, Helpers.round10(result))
  }
  
  func testSampleStandardDeviation_whenOne() {
    let result = Statistics.sampleStandardDeviation([1])
    XCTAssert(result == nil)
  }
  
  func testSampleStandardDeviation_whenEmpty() {
    let result = Statistics.sampleStandardDeviation([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Population standard deviation
  
  func testPopulationStandardDeviation() {
    let result = Statistics.populationStandardDeviation([1, 12, 19.5, -5, 3, 8])!
    XCTAssertEqual(7.9184208583, Helpers.round10(result))
  }
  
  func testPopulationStandardDeviation_whenOne() {
    let result = Statistics.populationStandardDeviation([1])!
    XCTAssertEqual(0, result)
  }
  
  func testPopulationStandardDeviation_whenEmpty() {
    let result = Statistics.populationStandardDeviation([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Sample covariance
  
  func testSampleCovariance() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Statistics.sampleCovariance(x: x, y: y)!
    
    XCTAssertEqual(5.03, Helpers.round10(result))
  }
  
  func testSampleCovariance_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 4]
    let result = Statistics.sampleCovariance(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testSampleCovariance_whenGivenSingleSetOfValues() {
    let x = [1.2]
    let y = [0.5]
    let result = Statistics.sampleCovariance(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testSampleCovariance_samplesAreEmpty() {
    let result = Statistics.sampleCovariance(x: [], y: [])
    
    XCTAssert(result == nil)
  }
  
  // MARK: - Population covariance
  
  func testPopulationCovariance() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Statistics.populationCovariance(x: x, y: y)!
    
    XCTAssertEqual(4.1916666667, Helpers.round10(result))
  }
  
  func testPopulationCovariance_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5]
    let result = Statistics.populationCovariance(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testPopulationCovariance_emptySamples() {
    let result = Statistics.populationCovariance(x: [], y: [])
    
    XCTAssert(result == nil)
  }
  
  // MARK: - Pearson product-moment correlation coefficient for a population
  // 0.843760859352745
  func testPopulationPearson() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Statistics.populationPearson(x: x, y: y)!
    
    XCTAssertEqual(0.8437608594, Helpers.round10(result))
  }
  
  func testPopulationPearson_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5]
    let result = Statistics.populationPearson(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testPopulationPearson_emptySamples() {
    let result = Statistics.populationPearson(x: [], y: [])
    
    XCTAssert(result == nil)
  }
}
