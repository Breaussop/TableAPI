//
//  ViewController.swift
//  TableAPI
//
//  Created by Field Employee on 10/29/20.
//

import UIKit

typealias ImgBundle = (img: UIImage,id: String)


class ViewController: UIViewController {

    @IBOutlet weak var myTable : UITableView!
        
   
    var myModel : Modeller = Modeller()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "TableViewCell", bundle: nil)
        self.myTable.register(nib, forCellReuseIdentifier: "tableCell")
        self.myTable.estimatedRowHeight = 100
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = myTable.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        let daPkge: ImgBundle = myModel.getPackage(table: tableView,path: indexPath)
        cell.cellLabel.text = daPkge.id
        cell.cellImage.image = daPkge.img
        return cell
    }
}
