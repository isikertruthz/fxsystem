const state = {
	subSidebarVisit : false,
	subRig : true,
	messagebarVisit : false
}

const mutations = {
	changeSubSidebarVisit(){
		state.subSidebarVisit = !state.subSidebarVisit
	},
	subSidebarVisit(){
		state.subSidebarVisit = true
	},	
	subSidebarHiden(){
		state.subSidebarVisit = false
	},
	messagebarVisit(){
		state.messagebarVisit = !state.messagebarVisit
	}
}

export default{
	state,
	mutations
}