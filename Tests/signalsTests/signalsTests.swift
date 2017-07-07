import XCTest
@testable import signals

class signalsTests: XCTestCase {

	func testFIR() {
		let taps = [1.0,2.0,-1.0]
		let filter = FIR(input: δ, taps: taps)
		let y = filter.output

		XCTAssert(y(0) == taps[0])
		XCTAssert(y(1) == taps[1])
		XCTAssert(y(2) == taps[2])


//		XCTAssertEqual(signals().text, "Hello, World!")
	}

	func testWaveformGenerator() {

	}

	func testMixer() {

	}


	static var allTests = [
		("testFIR", testFIR),
		("testWaveformGenerator", testWaveformGenerator),
		("testMixer", testMixer),
		]
}
