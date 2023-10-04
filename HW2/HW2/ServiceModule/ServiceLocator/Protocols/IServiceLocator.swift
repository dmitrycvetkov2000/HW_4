//
//  IServiceLocator.swift
//  HW2
//
//  Created by Дмитрий Цветков on 30.09.2023.
//

import Foundation

protocol IServiceLocator {
    func service<T>() -> T?
}
