import store from "../store";

if (localStorage.getItem("vue-ego")){
    store.commit("login/setUser",JSON.parse(localStorage.getItem("vue-ego")))
}
