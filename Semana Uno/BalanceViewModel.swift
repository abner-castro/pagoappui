//
//  BalanceViewModel.swift
//  Semana Uno
//
//  Created by Abner Castro on 13/01/23.
//

import Foundation

struct BalanceViewModel {
    var ammount: Int
    
    var ammountString: String {
        "$\(ammount).00 MXN"
    }
    
    let ammountToPay: [Int]
    
    init(ammount: Int) {
        self.ammount = ammount
        self.ammountToPay = (1...ammount).map { $0 }
    }
    
    func ammount(at row: Int) -> String {
        "$\(ammountToPay[row]).00 MXN"
    }
    
}
