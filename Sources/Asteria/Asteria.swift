//
//  Asteria.swift
//
//
//  Created by Jacob Lattie on 8/21/22.
//

import Foundation

public class Asteria {
    public let session: URLSession

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    public lazy var apodService = APODService(session: session)
}

