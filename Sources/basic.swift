//
//  basic.swift
//  signals
//
//  Created by Sean Hamilton on 7/7/17.
//
//

import Foundation

/// <#Description#>
public class SignalMixer<SignalSampleType: BinaryFloatingPoint>: SignalBlock<SignalSampleType> {
	public var inputs: [Signal]
	public var outputs: [Signal] {
		get { return [transform(inputs)]}
	}
	public var output: Signal { return outputs[0] }

	private var transform: ([Signal]) -> Signal = { inputs in
		return { i in inputs.reduce(SignalSampleType(0.0)) { $0 + $1(i) }}
	}

	public init(inputs: [Signal] = []) {
		self.inputs = inputs
	}

	public convenience init(inputs: Signal...) {
		self.init(inputs: inputs)
	}
}

//public class SignalDelayer
