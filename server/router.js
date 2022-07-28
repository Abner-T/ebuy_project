const express=require("express");
const router=express.Router();
const sqlClient=require("./config");
const jwt=require("jsonwebtoken");
const url=require("url")
const fs=require("fs")
const multer=require("multer")
const Mock=require("mockjs")

// 注册
router.post('/register',(req,res) =>{
        const {username,password,email} =req.body;
        const sql="insert into user values(null,?,?,?)";
        const arr=[username,password,email];
        sqlClient(sql,arr,result =>{
            if (result.affectedRows >0){
                res.send({
                    status:200,
                    msg:'注册成功'
                })
            }else {
                res.send({
                    status: 401,
                    msg:'注册失败'
                })
            }
        })
} )

//登陆
router.post("/login",(req,res)=>{
    const {username,password}=req.body;
    const sql="select * from user where username=? and password=?";
    const arr=[username,password];
    sqlClient(sql,arr,result=>{
        if (result.length>0){
            let token=jwt.sign({
                username,
                id:result[0].id
            },'soomekeys')
            res.send({
                status:200,
                token,
                username
            })
        }else {
            res.send({
                status:401,
                msg:"登陆失败"
            })
        }
    })
})

//商品分页
router.get('/backend/item/selectTbItemAllByPage',(req, res) => {
    //分页
    const page=url.parse(req.url,true).query.page || 1;
    const  sql="select * from project order by id desc limit 10 offset " +  (page - 1) *10;
    sqlClient(sql,null,result=>{
        if (result.length>0){
            res.send({
                status:200,
                result
            })
        }else {
            res.send({
                status:500,
                msg:'暂无数据'
            })
        }
    })
})


//商品总条数
router.get('/total',((req, res) => {
    const sql="select count(*) from project where id"
    sqlClient(sql,null,result=>{
        if (result.length>0){
            res.send({
                status:200,
                result
            })
        }else {
            res.send({
                status:500,
                msg:'暂无更多数据'
            })
        }
    })
}))

//模糊查询
router.get("/search",(req, res) => {
    const search=url.parse(req.url,true).query.search;
    const sql="select * from project where concat(`title`,`sellPoint`,`descs`) like '%" + search + "%'";
    sqlClient(sql,null,result=>{
        if(result.length>0){
            res.send({
                status:200,
                result
            })
        }else {
            res.send({
                status:500,
                msg:'暂无更多数据'
            })
        }
    })
})

//类目选择
router.get("/backend/itemCategory/selectItemCategoryByParentId",((req, res) => {
    const id=url.parse(req.url,true).query.id || 1
    const sql="select * from category where id=?";
    var arr=[id]
    sqlClient(sql,arr,result=>{
        if (result.length>0){
            res.send({
                status:200,
                result
            })
        }else{
            res.send({
                status:500,
                msg:'暂无数据'
            })
        }
    })
}))

//图片上传
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "./upload/")
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + "-" + file.originalname)
    }
})

var createFolder = function (folder) {
    try {
        fs.accessSync(folder);
    } catch (e) {
        fs.mkdirSync(folder);
    }
}

var uploadFolder = './upload/';
createFolder(uploadFolder);
var upload = multer({ storage: storage });

router.post('/upload', upload.single('file'), function (req, res) {
    var file = req.file;
    console.log('文件类型：%s', file.mimetype);
    console.log('原始文件名：%s', file.originalname);
    console.log('文件大小：%s', file.size);
    console.log('文件保存路径：%s', file.path);
    res.json({ res_code: '0', name: file.originalname, url: file.path });
});

//添加商品
router.get("/backend/item/insertTbItem",((req, res) => {
    const cid=url.parse(req.url,true).query.cid || '';
    const title=url.parse(req.url,true).query.title || '';
    const type=url.parse(req.url,true).query.type || '';
    const sellPoint=url.parse(req.url,true).query.sellPoint || '';
    const price=url.parse(req.url,true).query.price || '';
    const num=url.parse(req.url,true).query.num || '';
    const image=url.parse(req.url,true).query.image || '';
    const desc=url.parse(req.url,true).query.desc || '';
    const sql="insert into project values (null,?,?,?,?,?,?,?,1,?)";
    const arr=[title,type, image, sellPoint, price, cid, num, desc];

    sqlClient(sql,arr,result=>{
        if (result.affectedRows>0){
            res.send({
                status:200,
                msg:'添加成功'
            })
        }else {
            res.send({
                status:500,
                msg:'添加失败'
            })
        }
    })
}))

//商品删除
router.get("/backend/item/deleteItemById",((req, res) => {
    const id=url.parse(req.url,true).query.id;
    const sql="delete from project where id=?";
    const arr=[id];
    sqlClient(sql,arr,result=>{
        if (result.affectedRows>0){
            res.send({
                status:200,
                msg:'删除数据'
            })
        }else {
            res.send({
                status:500,
                msg:'删除失败'
            })
        }
    })
}))

//预更新
router.get("/backend/item/preUpdateItem",((req, res) => {
    const id=url.parse(req.url,true).query.id;
    const sql="select * from project where id=?";
    sqlClient(sql,[id],result=>{
        if (result.length>0){
            res.send({
                status:200,
                result
            })
        }else {
            res.send({
                status:500,
                msg:'预更新失败'
            })
        }
    })
}))

//商品编辑
router.get("/backend/item/updateTbItem",(req, res) => {
    const id=url.parse(req.url,true).query.id;
    const cid=url.parse(req.url,true).query.cid || '';
    const title=url.parse(req.url,true).query.title || '';
    const type=url.parse(req.url,true).query.type || '';
    const sellPoint=url.parse(req.url,true).query.sellPoint || '';
    const price=url.parse(req.url,true).query.price || '';
    const num=url.parse(req.url,true).query.num || '';
    const image=url.parse(req.url,true).query.image || '';
    const desc=url.parse(req.url,true).query.desc || '';
    const sql="update project set title=?,type=?,sellPoint=?,cid=?,price=?,num=?,descs=?,image=? where id=?";
    const arr=[title,type,sellPoint,cid,price,num,desc,image,id];
    sqlClient(sql,arr,result=>{
        if(result.affectedRows>0){
            res.send({
                status:200,
                msg:'修改成功'
            })
        }else {
            res.send({
                status:500,
                msg:'修改失败'
            })
        }
    })
})

//规格参数查询
router.get("/backend/itemParam/selectItemParamAll",((req, res) => {
    const page=url.parse(req.url,true).query.page || 1;
    const  sql="select * from params order by id desc limit 10 offset " +  (page - 1) *10;
    sqlClient(sql,null,result=>{
        if(result.length>0) {
            res.send({
                status: 200,
                result
            })
        }else {
            res.send({
                status:500,
                msg:'查询失败'
            })
        }
    })
}))

//规格参数模糊查询
router.get("/params/search",(req, res) => {
    const search=url.parse(req.url,true).query.search;
    const sql="select * from params where concat(`paramData`) like '%" + search + "%'";
    sqlClient(sql,null,result=>{
        if(result.length>0){
            res.send({
                status:200,
                result
            })
        }else {
            res.send({
                status:500,
                msg:'暂无更多数据'
            })
        }
    })
})

//规格总条数
router.get('/paramsTotal',((req, res) => {
    const sql="select count(*) from params where id"
    sqlClient(sql,null,result=>{
        if (result.length>0){
            res.send({
                status:200,
                result
            })
        }else {
            res.send({
                status:500,
                msg:'暂无更多数据'
            })
        }
    })
}))

//规格参数删除
router.get("/params/paramsDelete",((req, res) => {
    const id=url.parse(req.url,true).query.id;
    const sql="delete from params where id=?";
    const arr=[id];
    sqlClient(sql,arr,result=>{
        if (result.affectedRows>0){
            res.send({
                status:200,
                msg:'删除数据'
            })
        }else {
            res.send({
                status:500,
                msg:'删除失败'
            })
        }
    })
}))


 // 统计数据--销售信息
router.get('/statistical', (req, res) => {
    // eslint-disable-next-line no-undef
    res.send(Mock.mock({
        success: true,
        status: 200,
        "list|4": [
            {
                'id|+1': 100,
                "title|+1": ['总销售额', '访问量', '支付总量', '收藏量'],
                "current|0-2000": 100,
                "total|100-999999": 200
            }
        ]
    }))
})


 //  统计 半年 月销量对比数据
 // 月度销售额

router.get('/sellTotal', (req, res) => {
    // eslint-disable-next-line no-undef
    res.send(Mock.mock({
        success: true,
        status: 200,
        info: {
            'id|+1': 100,
            date: function () {
                var category = [];
                var dottedBase = +new Date();
                for (var i = 30; i > 0; i--) {
                    var date = new Date((dottedBase -= 1000 * 3600 * 24 * 30));
                    category.push([date.getFullYear(), date.getMonth() + 1].join("-"));
                }
                return category.slice(0, 6);
            },
            "xResult|3": [
                {
                    'xName|+1': ["家具", '手机', '家电'],
                    "data|6": [
                        { 'num|100-1000': 10 }
                    ]

                },
            ],
        }
    }))
})
module.exports=router
