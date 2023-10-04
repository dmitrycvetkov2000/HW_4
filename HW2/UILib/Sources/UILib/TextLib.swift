//
//  File.swift
//  
//
//  Created by Дмитрий Цветков on 04.10.2023.
//

import SwiftUI

public struct TextLib: View {
    var text: String
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        Text(text)
    }
    
    public init(text: String) {
        self.text = text
    }
}
