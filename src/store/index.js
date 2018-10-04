import Vue from 'vue'
import Vuex from 'vuex'
import status from '@/store/modules/status'

Vue.use(Vuex)

export default new Vuex.Store({
	modules:{
		status
	}
})