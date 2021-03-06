import XCTest
@testable import LLGeneral


class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let regx = "^\\w+@[\\w.]+$"
        
        let trues = [
            "sina123@ds.com",
            "da2131@qq",
            "3213@ewq."
        ]
        
        let falses = [
            "daasfsa.",
            ".",
            "@",
            " "
        ]
        
        let res = trues.map { $0.matches(regular: regx) } + falses.map { $0.matches(regular: regx) }
        
        XCTAssertFalse(res.contains(false))
    }
    
    func testClamp() {
        let result = [
            10.clamp(20...30) == 20,
            10.clamp(0...5) == 5,
            10.clamp(10...15) == 10,
            10.clamp(0...10) == 10,
            10.clamp(0.5...12.5) == 10
        ].reduce(true, { $0 && $1 })
        XCTAssertTrue(result)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
