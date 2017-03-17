//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Nick Walter on 7/28/15.
//  Copyright © 2015 Nick Walter. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createFriends()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func createFriends() {
        
        let elaine = Friend()
        elaine.name = "Elaine"
        elaine.phoneNumber = "503-534-7723"
        elaine.birthday = "September 4th"
        elaine.picture = UIImage(named: "elaine_benes")!
        self.friends.append(elaine)
        
        let george = Friend()
        george.name = "George"
        george.phoneNumber = "281-330-8004"
        george.birthday = "March 18th"
        george.picture = UIImage(named: "george_costanza")!
        self.friends.append(george)
        
        let krammer = Friend()
        krammer.name = "Krammer"
        krammer.phoneNumber = "1-800-456-8756"
        krammer.birthday = "Deccember 1st"
        krammer.picture = UIImage(named: "cosmo_kramer")!
        self.friends.append(krammer)
        
        let jerry = Friend()
        jerry.name = "Jerry"
        jerry.phoneNumber = "712-537-5633"
        jerry.birthday = "April 1st"
        jerry.picture = UIImage(named: "jerry-seinfeld")!
        self.friends.append(jerry)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: friend)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! FriendDetailViewController
        detailVC.friend = sender as! Friend
    }
    
}

