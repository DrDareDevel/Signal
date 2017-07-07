//
//  filters.swift
//  signals
//
//  Created by Sean Hamilton on 7/7/17.
//
//

//TODO: Implement using SIMD

import Foundation

public func δ<SignalSampleType: BinaryFloatingPoint>(_ i: Int) -> SignalSampleType {
	if i == 0 {
		return 1.0
	}

	return 0.0
}

public class FIR<SignalSampleType: BinaryFloatingPoint>: SignalFilter<SignalSampleType> {
	public var input: Signal { return inputs[0] }
	public var output: Signal { return outputs[0] }
	override public var outputs: [Signal] { return [convolve] }
	public var taps: [SignalSampleType]

	public init(input: @escaping Signal, taps: [SignalSampleType]) {
		self.taps = taps
		super.init(inputs: [input])
	}

	private func convolve(_ n: Int) -> SignalSampleType {
		var sum: SignalSampleType = 0.0
		for i in 0..<taps.count {
			sum += taps[i] * input(n-i)
		}
		return sum
	}
}
