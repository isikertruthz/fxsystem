const state = {
	subSidebarVisit : false,
	subRig : true,
	messagebarVisit : false,
	location : "",
	locationID : "",
	subSidebarList : [],
	subSidebardef :[],
	curtable : "",
	pageLoction: "",
	clickStatus : false,
	sidebarmax : true
}

const mutations = {
	changeSubSidebarVisit(state){
		state.subSidebarVisit = !state.subSidebarVisit
	},
	subSidebarVisit(state){
		state.subSidebarVisit = true
	},	
	curTable(state,table){
		state.curtable = table
	},
	pgloc(state,pgloc){
		state.pageLoction = pgloc
	},
	subSidebarHiden(state){
		state.subSidebarVisit = false
	},
	messagebarVisit(state){
		state.messagebarVisit = !state.messagebarVisit
	},
	subbsidebarLocation(state,key){
		state.location = key
	},
	subbsidebarList(state,list){
		state.subSidebarList = list
	},
	subSidebardef(state,def){
		state.subSidebardef = def
	},
	setclickStatus(state){
		state.clickStatus = !state.clickStatus
	},
	haddleLocationID(state,id){
		state.locationID = id 
	},
	handlesidebarmax(state){
		state.sidebarmax = !state.sidebarmax
	},
	setsidebarmax(state,value){
		state.sidebarmax = value
	}


}

export default{
	state,
	mutations
}