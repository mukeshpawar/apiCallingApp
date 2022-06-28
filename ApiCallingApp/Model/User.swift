//
//  RadioList.swift
//  ApiCallingApp
//
//  Created by Mukesh Pawar on 21/06/22.
//

import Foundation


// MARK: - User
struct User: Decodable {
    let status: String
    let data: [UserData]
    let message: String
}

// MARK: - UserData
struct UserData: Decodable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
