//
//  Theme.swift
//  Lost-Summoner
//
//  Created by Bailey Leiseth on 12/25/23.
//

import Foundation
import UIKit

var currentTheme: Theme = riida
struct Theme {
    let key: String
    let tapImages: [UIImage]
    let title: UIColor
    let body: UIColor
    let shadow: UIColor
    
    let header: UIColor
    let rankBG: UIColor
    let expFill: UIColor
    let expBG: UIColor
    
    let footer: UIColor
    let overlay: UIColor
    
    let buttonFill: UIColor
    let buttonBorder: UIColor
    
    let background:UIColor
    let cellBG: UIColor
    let accent: UIColor
}
//MARK: Teal
let images: [UIImage] = []

let teal = Theme(key: "teal",
                 tapImages: images,
                 title: .white,
                 body: UIColor(hex: "#363636")!,
                 shadow: UIColor(hex: "#363636")!,
                 header: UIColor(hex: "#00FFF0")!,
                 rankBG: UIColor(hex: "#000000", opacity: 0.1)!,
                 expFill: UIColor(hex: "#00ACA2")!,
                 expBG: UIColor(hex: "#E8FAFF", opacity: 0.6)!,
                 footer: UIColor(hex: "#00FFF0")!,
                 overlay: UIColor(hex: "#000000", opacity: 0.1)!,
                 buttonFill: UIColor(hex: "#C2FFFB")!,
                 buttonBorder: UIColor(hex: "#00FFF0")!,
                 background: UIColor(hex: "#E8FAFF")!,
                 cellBG: UIColor(hex: "#A1FFF9")!, //titch lighter
                 accent: UIColor(hex: "#A1FFF9")!)

//MARK: Purple
let purple = Theme(key: "purple",
                   tapImages: images,
                   title: .white,
                   body: UIColor(hex: "#2B004C")!,
                   shadow: UIColor(hex: "#2B004C")!,
                   header: UIColor(hex: "#8F00FF")!,
                   rankBG: UIColor(hex: "#FFFFFF", opacity: 0.2)!,
                   expFill: UIColor(hex: "#6000AC")!,
                   expBG: UIColor(hex: "#FFFFFF", opacity: 0.6)!,
                   footer: UIColor(hex: "#8F00FF")!,
                   overlay: UIColor(hex: "#000000", opacity: 0.2)!,
                   buttonFill: UIColor(hex: "#C985FF")!,
                   buttonBorder: UIColor(hex: "#8F00FF")!,
                   background: UIColor(hex: "#F7EDFF")!,
                   cellBG: UIColor(hex: "#D8A6FF")!,
                   accent: UIColor(hex: "#D8A6FF")!)

//MARK: Patriotic
let patriotic = Theme(key: "patriotic", 
                      tapImages: images,
                      title: .white,
                      body: UIColor(hex: "#363636")!,
                      shadow: UIColor(hex: "#363636")!,
                      header: UIColor(hex: "#FF5454")!,
                      rankBG: UIColor(hex: "#FFFFFF", opacity: 0.2)!,
                      expFill: UIColor(hex: "#5CEDFF")!,
                      expBG: UIColor(hex: "#E8FAFF", opacity: 0.6)!,
                      footer: UIColor(hex: "#5CEDFF")!,
                      overlay: UIColor(hex: "#000000", opacity: 0.1)!,
                      buttonFill: UIColor(hex: "#BEF8FF")!,
                      buttonBorder: UIColor(hex: "#FF5454")!,
                      background: UIColor(hex: "#E8FAFF")!,
                      cellBG: UIColor(hex: "#FF7676")!, //lighter
                      accent: UIColor(hex: "#9AF4FF")!)

//MARK: Red
let red = Theme(key: "red", 
                tapImages: images,
                title: .white,
                body: UIColor(hex: "#560000")!,
                shadow: UIColor(hex: "#560000")!,
                header: UIColor(hex: "#FF0000")!,
                rankBG: UIColor(hex: "#9E9E9E", opacity: 0.2)!,
                expFill: UIColor(hex: "#A90000")!,
                expBG: UIColor(hex: "#FFFFFF", opacity: 0.6)!,
                footer: UIColor(hex: "#FF0000")!,
                overlay: UIColor(hex: "#000000", opacity: 0.1)!,
                buttonFill: UIColor(hex: "#FFAEAE")!,
                buttonBorder: UIColor(hex: "#FF0000")!,
                background: UIColor(hex: "#FFEBEB")!,
                cellBG: UIColor(hex: "#FFCECE")!,
                accent: UIColor(hex: "#FFCECE")!)


//MARK: Green
let green = Theme(key: "green",
                  tapImages: images,
                  title: .white,
                  body: UIColor(hex: "#315900")!,
                  shadow: UIColor(hex: "#315900")!,
                  header: UIColor(hex: "#8FFF00")!,
                  rankBG: UIColor(hex: "#9E9E9E", opacity: 0.3)!,
                  expFill: UIColor(hex: "#5EAA00")!,
                  expBG: UIColor(hex: "#FFFFFF", opacity: 0.6)!,
                  footer: UIColor(hex: "#8FFF00")!,
                  overlay: UIColor(hex: "#000000", opacity: 0.1)!,
                  buttonFill: UIColor(hex: "#D4FF9F")!,
                  buttonBorder: UIColor(hex: "#8FFF00")!,
                  background: UIColor(hex: "#F0FFDD")!,
                  cellBG: UIColor(hex: "#E4FFC1")!,
                  accent: UIColor(hex: "#E4FFC1")!)

//MARK: Wirefrane
let wireframe = Theme(key: "wireframe",
                      tapImages: images,
                      title: .white,
                      body: UIColor(hex: "#363636")!,
                      shadow: UIColor(hex: "#363636")!,
                      header: UIColor(hex: "#CFCFCF")!,
                      rankBG: UIColor(hex: "#9E9E9E", opacity: 0.5)!,
                      expFill: UIColor(hex: "#EEEEEE")!,
                      expBG: UIColor(hex: "#000000", opacity: 0.1)!,
                      footer: UIColor(hex: "#CFCFCF")!,
                      overlay: UIColor(hex: "#000000", opacity: 0.1)!,
                      buttonFill: UIColor(hex: "#DFDFDF")!,
                      buttonBorder: UIColor(hex: "#CFCFCF")!, //needs to be a titch darker
                      background: .white,
                      cellBG: UIColor(hex: "#EBEBEB")!,
                      accent: UIColor(hex: "#EBEBEB")!)
 
//MARK: Riida
let riidaImages: [UIImage] = [UIImage(named: "riida_tap0")!,
                 UIImage(named: "riida_tap1")!,
                 UIImage(named: "riida_tap2")!,
                 UIImage(named: "riida_tap3")!,
                 UIImage(named: "riida_tap4")!,
                 UIImage(named: "riida_tap5")!,
                 UIImage(named: "riida_tap6")!,
                 UIImage(named: "riida_tap7")!,
                 UIImage(named: "riida_tap8")!,
                 UIImage(named: "riida_tap9")!,
                 UIImage(named: "riida_tap10")!,
                 UIImage(named: "riida_tap11")!,
                 UIImage(named: "riida_tap12")!,
                 UIImage(named: "riida_tap13")!,
                 UIImage(named: "riida_tap14")!,
]
let riida = Theme(key: "riida",
                  tapImages: riidaImages,
                  title: .white,
                  body: UIColor(hex: "#652B00")!,
                  shadow: UIColor(hex: "#575757")!,
                  header: UIColor(hex: "#B5D750")!,
                  rankBG: UIColor(hex: "#A5CAED")!,
                  expFill: UIColor(hex: "#EAD369")!,
                  expBG: UIColor(hex: "#A5D388")!,
                  footer: UIColor(hex: "#B5D750")!,
                  overlay: UIColor(hex: "#FFFFFF", opacity: 0.2)!,
                  buttonFill: UIColor(hex: "#FAE58B")!,
                  buttonBorder: UIColor(hex: "#C26E39")!,
                  background: UIColor(hex: "#A5D388")!,
                  cellBG: UIColor(hex: "#EEF8BF")!,
                  accent: UIColor(hex: "#0C733A")!)
