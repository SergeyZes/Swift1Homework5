import UIKit

//Задание 1
protocol Car {
    var brand: String { get }
    var isWindowOpened: Bool { get set }
    var isEngineOn: Bool { get set }
    var isCarBlocked: Bool { get set }
    func blockCar(blocked: Bool)
}

//Задание 2

extension Car {
    mutating func startEngine() {
        isEngineOn = true
    }
    mutating func stopEngine() {
        isEngineOn = false
    }
    
    mutating func openWindow(){
        isWindowOpened = true
    }
    
    mutating func closeWindow() {
        isWindowOpened = false
    }

}

//Задание 3
class SportCar: Car {
    let brand: String
    
    var isWindowOpened: Bool = false
    var isEngineOn: Bool = false
    var isCarBlocked: Bool = false
    let hasSpoiler: Bool
    var isSpoilerOn: Bool = false
    
    
    func blockCar(blocked: Bool) {
        isCarBlocked = blocked
    }
    
    func runCar() {
        if hasSpoiler { isSpoilerOn = true }
        isEngineOn = true
    }
    
    func stopCar() {
        isSpoilerOn = false
    }
    
    init(hasSpoiler: Bool, brand: String) {
        self.hasSpoiler = hasSpoiler
        self.brand = brand
    }
}

class TrunkCar: Car {
    let brand: String
    
    var isWindowOpened: Bool = false
    var isEngineOn: Bool = false
    var isCarBlocked: Bool = false
    let trunkCapacity: Double
    var truncLoaded: Double = 0
    var isSpoilerOn: Bool = false
    
    
    func blockCar(blocked: Bool) {
        isCarBlocked = blocked
    }
    
    
    func loadCar(weight: Double) {
        guard weight + truncLoaded < trunkCapacity else { return }
        truncLoaded += weight
    }
    
    func unloadCar(weight: Double) {
        guard truncLoaded - weight >= 0 else { return }
        truncLoaded -= weight
    }

    
    init(trunkCapacity: Double, brand: String) {
        self.trunkCapacity = trunkCapacity
        self.brand = brand
    }
}

//Задание 4
extension SportCar: CustomStringConvertible {
    var description: String {
        
        return "\(brand) окно \(isWindowOpened ? "открыто" : "закрыто") двигатель \(isEngineOn ? "включен" : "выключен") дверь \(isCarBlocked ? "заблокирована" : "разблокирована") спойлер \(hasSpoiler ? "есть" : "нет") \(isSpoilerOn ? "поднят" : "")"
    }

}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        
        return "\(brand) окно \(isWindowOpened ? "открыто" : "закрыто") двигатель \(isEngineOn ? "включен" : "выключен") дверь \(isCarBlocked ? "заблокирована" : "разблокирована") вместимость \(trunkCapacity) загружено \(truncLoaded)"
    }

}

//Задание 5

var sc1 = SportCar(hasSpoiler: true, brand: "Aston Martin")
var sc2 = SportCar(hasSpoiler: false, brand: "Ferrari")

var tc1 = TrunkCar(trunkCapacity: 300, brand: "MAN")
var tc2 = TrunkCar(trunkCapacity: 500, brand: "Freightliner")

sc1.runCar()
sc2.openWindow()

tc1.loadCar(weight: 250)
tc1.loadCar(weight: 70)
tc1.startEngine()

tc2.loadCar(weight: 100)
tc2.unloadCar(weight: 120)
tc2.openWindow()

//Задание 6
print(sc1)
print(sc2)

print(tc1)
print(tc2)

