const prefix = '__webqt__'

export default{
    get (key){
        let response = window.localStorage.getItem(prefix + key)
        if(response){
            return JSON.parse(response)
        }
        return null
    },

    set (key,value){
        window.localStorage.setItem(prefix + key,JSON.stringify(value))
        return true  
    },

    remove (key){
        window.localStorage.removeItem(prefix + key)
        return true
    }
}