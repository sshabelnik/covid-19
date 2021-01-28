//
//  NumericExtension.swift
//  covid-19
//
//  Created by Сергей Шабельник on 21.01.2021.
//  Copyright © 2021 Сергей Шабельник. All rights reserved.
//

import Foundation

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
