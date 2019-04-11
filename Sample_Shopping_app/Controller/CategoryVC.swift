//
//  ViewController.swift
//  Sample_Shopping_app
//
//  Created by yasser ahmed on 4/9/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UITableViewDataSource , UITableViewDelegate {
    let Categories=DataService.inestance.getcategories()
    
    @IBOutlet weak var CategoryTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  Categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "tableviewcellidnty") as?
            CategoryCell
        {
           cell.setValues(Forname: Categories[indexPath.row].categoryname, forimage: Categories[indexPath.row].categoryimage)
            return cell
        }
        return CategoryCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = Categories[indexPath.row]
        
        performSegue(withIdentifier: "productsegue", sender:selected )
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if  let productvc = segue.destination as? ProductsVC
      {
        assert(sender as? Category != nil)
        productvc.getProducts(category: sender as! Category)
    
        let backbtn=UIBarButtonItem()
        backbtn.title=""
        navigationItem.backBarButtonItem=backbtn
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryTableView.dataSource=self
        CategoryTableView.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

