//
//  UIColor + Extension.swift
//  Shared_UI
//
//  Created by Ahmed Atef on 16/03/2023.
//
import Foundation
import UIKit

extension UIColor {
    static var blueColor: UIColor {
        UIColor(named: "blue") ?? .blue
    }
    static var lightBlueColor: UIColor {
        UIColor(named: "lightBlue")!
    }
    static var grayColor: UIColor {
        UIColor(named: "gray") ?? .gray
    }
    static var redColor: UIColor {
        UIColor(named: "red") ?? .red
    }
    static var whiteColor: UIColor {
        UIColor(named: "white") ?? .white
    }
    static var navyBlackColor: UIColor {
        UIColor(named: "navyBlack") ?? .black
    }
}
