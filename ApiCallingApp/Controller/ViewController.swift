//
//  ViewController.swift
//  ApiCallingApp
//
//  Created by Mukesh Pawar on 21/06/22.
//

import UIKit



class ViewController : UIViewController{
    
    @IBOutlet weak var dataTableView: UITableView!
    
    private var userViewModel : UserViewModel!
    
    private var dataSource : UserTableViewDataSource<UserTableViewCell,UserData>!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
         
         self.userViewModel =  UserViewModel()
         self.userViewModel.bindUserViewModelToController = {
             self.updateDataSource()
         }
     }
    
    func updateDataSource(){
         
         self.dataSource = UserTableViewDataSource(cellIdentifier: "UserTableViewCell", items: self.userViewModel.empData.data, configureCell: { (cell, emp) in
             cell.employeeIdLabel.text =  String(format: "%d", emp.id)
             cell.employeeNameLabel.text = emp.employeeName
         })
         
         DispatchQueue.main.async {
             self.dataTableView.dataSource = self.dataSource
             self.dataTableView.reloadData()
         }
     }
    
    
}




