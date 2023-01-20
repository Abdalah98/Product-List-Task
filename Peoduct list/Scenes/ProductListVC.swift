//
//  ProductListVC.swift
//  Peoduct list
//
//  Created by Bedo on 20/01/2023.
//

import UIKit
class ProductListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var productListVIewModel: ProductListVIewModel =
        {
            return  ProductListVIewModel()
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableViewDesign()
        initVM()
    }
    
    fileprivate func tableViewDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        configureNIBCell()
    }
   
    private  func configureNIBCell(){
        let nib = UINib(nibName: "ProductListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductListTableViewCell")
    }
    
    
    func initVM(){
        productListVIewModel.showAlertClosure = { [weak self ] () in
                    DispatchQueue.main.async {
                        if let message = self?.productListVIewModel.alertMessage {
                            self?.showAlert(withTitle: "", withMessage: message)
                        }
                    }
        
                }
        productListVIewModel.updateLoadingStatus = { [weak self] () in
                    guard let self = self else {
                        return
                    }
        
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {
                            return
                        }
                        switch self.productListVIewModel.state {
                        case .empty, .error:
                            self.dismissLoadingView()
                            UIView.animate(withDuration: 0.2, animations: {
                                self.tableView.alpha = 0.0
                            })
                        case .loading:
                            self.showLoadingView()
                            UIView.animate(withDuration: 0.2, animations: {
                                self.tableView.alpha = 0.0
                            })
                        case .populated:
                            self.dismissLoadingView()
                            UIView.animate(withDuration: 0.2, animations: {
                                self.tableView.alpha = 1.0
                            })
                        }
                    }
                }
        
        productListVIewModel.reloadTableViewClouser = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        productListVIewModel.initFetchData()
        
    }
}
