import Foundation

class NetworkLayer {
    
    static var shared = NetworkLayer()
    
    func getSomeData(finished: ()->Void ) {
        //faking some network call
        finished()
    }
}
