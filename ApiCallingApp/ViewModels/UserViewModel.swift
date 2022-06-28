//
//  UserViewModel.swift
//  ApiCallingApp
//
//  Created by Mukesh Pawar on 22/06/22.
//

import Foundation
import PromiseKit

class UserViewModel : NSObject {
    
    private var apiManager : APIManager!
    private(set) var empData : User! {
        didSet {
            self.bindUserViewModelToController()
        }
    }
    

    var userData : Promise<User>!
    
    
    var bindUserViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiManager =  APIManager()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiManager.apiToGetUserData { (empData) in
            self.empData = empData
        }
//        self.userData =  apiManager.apiToGetUserDatanew();
    }
}
