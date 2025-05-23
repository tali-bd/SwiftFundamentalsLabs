import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }

    var athletes: [Athlete] = []
    
    @IBAction func unwindToAthleteTableView(segue: UIStoryboardSegue)
    {
        guard let formVC = segue.source as? AthleteFormViewController,
              let athlete = formVC.athlete else{return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            athletes.append(athlete)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let destinationVC = segue.destination as? AthleteFormViewController{
            //pass data to athlete form VC
            
            if let indexPath = tableView.indexPathForSelectedRow,
                segue.identifier == PropertyKeys.editAthleteSegue {
                destinationVC.athlete = athletes[indexPath.row]
            }
            
        }
        
    }

    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
 */

}
