//
//  ViewController.swift
//  SideMenu
//
//  Created by Mac on 26/03/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrData = ["Login","Mobile","Inbox","Call","LogOut"]
    var arrImg = ["login","mobile","inbox","call","logout"]
    @IBOutlet weak var sideView: UIView!
    
    @IBOutlet weak var sideBar: UITableView!
    var isSideViewOpen : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideView.isHidden = true
        sideBar.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideBar.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.img.image = UIImage(named: arrImg[indexPath.row])
        cell.label.text = arrData[indexPath.row]
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let loginVC : LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    @IBAction func menuBtn(_ sender: UIButton) {
        sideBar.isHidden = false
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if isSideViewOpen {
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 0, width: 252, height: 553)
            sideBar.frame = CGRect(x: 0, y: 0, width: 252, height: 553)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 10, width: 0, height: 553)
            sideBar.frame = CGRect(x: 0, y: 0, width: 0, height: 553)
            UIView.commitAnimations()
            
        }else{
            isSideViewOpen = false
            sideView.frame = CGRect(x: 0, y: 10, width: 0, height: 553)
            sideBar.frame = CGRect(x: 0, y: 0, width: 0, height: 553)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 0, width: 252, height: 553)
            sideBar.frame = CGRect(x: 0, y: 0, width: 252, height: 553)
            UIView.commitAnimations()
        }
       
    }
    
}
