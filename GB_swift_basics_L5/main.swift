//
//  main.swift
//  GB_swift_basics_L5
//
//  Created by Victor Lipov on 10.06.2021.
//

import Foundation


enum CarActions: String {
    case openWindow = "Окно открыто"
    case closeWindow = "Окно закрыто"
    case engineStart = "Двигатель заведен"
    case engineStop = "Двигатель заглушен"
}

enum SportCarActions: String {
    case slickTyre = "Установлены слики"
    case rainTyre = "Установлена дождевая резина"
}

enum TrunkCarActions: String {
    case attachTrailer = "Прицеп присоединен"
    case detouchTrailer = "Прицеп отсоединен"
}


//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.


protocol Car: AnyObject {
    var model: String { get }
    var year: Int { get }
    var trunkSizeTotal: Int { get }
    var engineRunning: Bool { get set }
    var windowsOpen: Bool { get set }
    
    func doWithCar()
    
}


//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).


extension Car {
    
    func doWithCar(_ mode: CarActions) {
        print(mode.rawValue)
        switch mode {
        case .openWindow:
            self.windowsOpen = true
        case .closeWindow:
            self.windowsOpen = false
        case .engineStart:
            self.engineRunning = true
        case .engineStop:
            self.engineRunning = false
        }
        
    }
    
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.


class sportCar: Car {
    var model: String
    var year: Int
    var trunkSizeTotal: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    
    var tyreType: String
    
    func doWithCar() {
        
    }
    
    func doWithSportCar(_ mode: SportCarActions) {
        print(mode.rawValue)
        switch mode {
        case .slickTyre:
            self.tyreType = "Slick Tyres"
        case .rainTyre:
            self.tyreType = "Rain Tires"
        }
    }
    
    init(model: String, year: Int, trunkSizeTotal: Int, engineRunning: Bool, windowsOpen: Bool, tyreType: String) {
        
        self.model = model
        self.year = year
        self.trunkSizeTotal = trunkSizeTotal
        self.engineRunning = engineRunning
        self.windowsOpen = windowsOpen
        self.tyreType = tyreType
    }
}

class trunkCar: Car {
    var model: String
    var year: Int
    var trunkSizeTotal: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    
    var hasTrailer: Bool
    
    func doWithCar() {
        
    }
    
    func doWithTrunkCar(_ mode: TrunkCarActions) {
        print(mode.rawValue)
        switch mode {
        case .attachTrailer:
            self.hasTrailer = true
        case .detouchTrailer:
            self.hasTrailer = false
        }
    }
    
    init(model: String, year: Int, trunkSizeTotal: Int, engineRunning: Bool, windowsOpen: Bool, hasTrailer: Bool) {
        
        self.model = model
        self.year = year
        self.trunkSizeTotal = trunkSizeTotal
        self.engineRunning = engineRunning
        self.windowsOpen = windowsOpen
        self.hasTrailer = hasTrailer
    }
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

extension trunkCar: CustomStringConvertible {
    var description: String {
        return """
               I'm, a truck \(hasTrailer ? "with trailer" : "without trailer"),
               my engine is \(engineRunning ? "running" : "not running"),
               and my windows are \(windowsOpen ? "open" : "closed")
               """
    }
}


//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

var mySportCar = sportCar(model: "BMW", year: 2000, trunkSizeTotal: 10, engineRunning: false, windowsOpen: false, tyreType: "Slick Tyres")

print(mySportCar)

mySportCar.doWithSportCar(.rainTyre)
mySportCar.doWithCar(.engineStart)

print(mySportCar)


var myTrunkCar = trunkCar(model: "Peterbilt", year: 2010, trunkSizeTotal: 20000, engineRunning: false, windowsOpen: false, hasTrailer: false)

print(myTrunkCar)

myTrunkCar.doWithTrunkCar(.detouchTrailer)
myTrunkCar.doWithCar(.openWindow)

print(myTrunkCar)

