import Foundation


open class SignalBlock<SignalSampleType: BinaryFloatingPoint> {
	public typealias Signal = (Int) -> SignalSampleType
}

open class SignalGenerator<SignalSampleType: BinaryFloatingPoint>: SignalBlock<SignalSampleType> {
	open var outputs: [Signal] { return [] }
}

open class SignalTransducer<SignalSampleType: BinaryFloatingPoint>: SignalBlock<SignalSampleType> {
	open var inputs: [Signal]

	public init(inputs: [Signal] = []) {
		self.inputs = inputs
	}

	public convenience init(inputs: Signal...) {
		self.init(inputs: inputs)
	}
}

open class SignalFilter<SignalSampleType: BinaryFloatingPoint>: SignalBlock<SignalSampleType> {

	open var inputs: [Signal]
	open var outputs: [Signal] { return [] }

	public init(inputs: [Signal] = []) {
		self.inputs = inputs
	}

	public convenience init(inputs: Signal...) {
		self.init(inputs: inputs)
	}
}
