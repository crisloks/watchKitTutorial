
import WatchKit
import Foundation

struct Constants {
    static let kFlightsRow = "FlightRow"
}


class ScheduleInterfaceController: WKInterfaceController {
    @IBOutlet var flightsTable: WKInterfaceTable!
    
    var flights = Flight.allFlights()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        flightsTable.setNumberOfRows(flights.count, withRowType: Constants.kFlightsRow)
        
        for index in 0..<flightsTable.numberOfRows {
            if let controller = flightsTable.rowControllerAtIndex(index) as? FlightRowController {
                controller.flight = flights[index]
            }
        }
    }

}
