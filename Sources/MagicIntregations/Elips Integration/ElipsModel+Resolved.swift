//
//  ElipsModel+Resolved.swift
//  Local helper for G-Sensor: prefers wordToNumber when Elips sends it, else outputWords.
//

import Foundation

extension ElipsModel {
    /// Display word for peek UI and connection tests.
    public var resolvedOutputWords: String {
        let mapped = wordToNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        if !mapped.isEmpty { return mapped }
        return outputWords.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public static func decodeResponse(from data: Data) throws -> ElipsModel {
        do {
            return try JSONDecoder().decode(ElipsModel.self, from: data)
        } catch {
            throw ErrorsEnum.invalidDecodeResponse
        }
    }
}
