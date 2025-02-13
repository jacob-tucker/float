import FLOAT from "../FLOAT.cdc"
import NonFungibleToken from "../core-contracts/NonFungibleToken.cdc"

transaction(eventId: UInt64, recipient: Address) {

	let FLOATEvents: &FLOAT.FLOATEvents
	let RecipientCollection: &FLOAT.Collection{NonFungibleToken.CollectionPublic}

	prepare(signer: AuthAccount) {
		self.FLOATEvents = 
			signer.borrow<&FLOAT.FLOATEvents>(from: FLOAT.FLOATEventsStoragePath)
					?? panic("Could not borrow the signer's FLOAT Events resource.")
		self.RecipientCollection = 
			getAccount(recipient).getCapability(FLOAT.FLOATCollectionPublicPath)
				.borrow<&FLOAT.Collection{NonFungibleToken.CollectionPublic}>()
				?? panic("Could not get the public FLOAT Collection from the recipient.")
	}

	execute {
		//
		// Give the "recipient" a FLOAT from the event with "id"
		//

		self.FLOATEvents.distributeDirectly(id: eventId, recipient: self.RecipientCollection)
		log("Distributed the FLOAT.")

		//
		// SOME OTHER ACTION HAPPENS
		//
	}
}