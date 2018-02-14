//
//  ActivityTableViewController.swift
//  VIPERDesignSample
//
//  Created by Swayambhu Jyoti Banerjee on 2/13/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import UIKit

class ActivityPresenterTableViewController: UITableViewController {

    var presenter : ActivityViewToPresenterProtocol?
    var claimsList: [Claim] = []
    var appointmentList: [Appointment] = []
    private var commonTableCellIdentifier = "commonTableCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let activitiesNib = UINib(nibName: "CommonTableViewCell", bundle: nil)
        self.tableView.register(activitiesNib, forCellReuseIdentifier: commonTableCellIdentifier)
        
        self.tableView.tableFooterView = UIView()
        presenter?.loadActivities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return claimsList.count
        } else {
            return appointmentList.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: commonTableCellIdentifier, for: indexPath) as? CommonTableViewCell

        if indexPath.section == 0 {
            cell?.configureClaimCell(activity: claimsList[indexPath.row])
        } else {
            cell?.configureAppointmentCell(activity: appointmentList[indexPath.row])
        }
        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
             return "Claim"
        } else {
            return "Appointment"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let claim = claimsList[indexPath.row]
            presenter?.showActivityDetail(forActivity: claim)
        } else {
            let appointment = appointmentList[indexPath.row]
            presenter?.showActivityDetail(forActivity: appointment)
        }

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ActivityPresenterTableViewController : ActivityPresenterToViewProtocol {
    
    func showClaim(claimArray : [Claim]) {
        claimsList = claimArray
        tableView.reloadSections([0], with: .none)
        
    }
    func showAppointment(appointmentArray: [Appointment]) {
        appointmentList = appointmentArray
        tableView.reloadSections([1], with: .none)

}
}
