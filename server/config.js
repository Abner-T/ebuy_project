const mysql=require("mysql");

const client=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    port:'3307',
    database:'vue-ego'
})

const sqlClient=(sql,arr,callback)=>{
    client.query(sql,arr,(error,result)=>{
        if (error){
            console.log(error);
            return;
        }else {
            callback(result)
        }
    })
}

module.exports=sqlClient
