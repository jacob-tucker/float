import FLOAT from "../FLOAT.cdc"

transaction(id: UInt64) {

  let FLOATEvents: &FLOAT.FLOATEvents

  prepare(acct: AuthAccount) {
    self.FLOATEvents = acct.borrow<&FLOAT.FLOATEvents>(from: FLOAT.FLOATEventsStoragePath)
                        ?? panic("Could not borrow the FLOATEvents from the signer.")
  }

  execute {
    self.FLOATEvents.deleteEvent(id: id)
    log("Removed the FLOAT Event.")
  }
}