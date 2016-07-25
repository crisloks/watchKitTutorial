
import WatchKit
import Foundation

struct Constants {
    static let kFlightsRow = "FlightRow"
    static let kFlightController = "Flight"
    static let kCheckInController = "CheckIn"
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
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let flight = flights[rowIndex]
        let controllers = [Constants.kFlightController, Constants.kCheckInController]
        presentControllerWithNames(controllers, contexts: [flight, flight])
    }

}
