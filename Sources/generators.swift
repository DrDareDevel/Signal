//
//  generators.swift
//  signals
//
//  Created by Sean Hamilton on 7/7/17.
//
//

import Foundation

/// <#Description#>
public class WaveformSignalGenerator: SignalGenerator<Double> {
	public enum SignalWaveform {
		case sine
		case cosine
		case square
		case triangle
	}

	override public var outputs: [Signal] {
			var gen: Signal
			switch waveform {
			case .sine:
				gen = {i in sin(Double(i) * self.phi)}
			case .cosine:
				gen = {i in cos(Double(i) * self.phi)}
			default:
				fatalError("Waveform \(waveform) is not yet implemented")
			}

			return [gen]
	}
	public var output: Signal { return outputs[0] }

	private(set) var phi: Double
	public var	sampleRate: Double {
		didSet {
			phi = 2.0 * Double.pi * (frequency / sampleRate)
		}
	}
	public var frequency: Double {
		didSet {
			phi = 2.0 * Double.pi * (frequency / sampleRate)
		}
	}

	public var waveform: SignalWaveform

	public init(waveform: SignalWaveform, frequency: Double, samplingRate: Double) {
		self.waveform = waveform
		self.frequency = frequency
		sampleRate = samplingRate
		phi = 2.0 * Double.pi * (frequency / sampleRate)
	}
}
