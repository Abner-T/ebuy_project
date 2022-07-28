const base={
    baseUrl:'http://localhost:3000',
    register:"/api/register",
    login:"/api/login",
    selectTbItemAllByPage:"/api/backend/item/selectTbItemAllByPage", //商品列表
    total:'/api/total', //商品总条数
    search:'/api/search', //模糊查询
    selectItemCategoryByParentId:'/api/backend/itemCategory/selectItemCategoryByParentId',//类目选择
    insertTbItem:'/api/backend/item/insertTbItem', //插入商品
    deleteItemById:"/api/backend/item/deleteItemById", //删除商品
    preUpdateItem:"/api/backend/item/preUpdateItem", //预更新
    updateTbItem:"/api/backend/item/updateTbItem", //商品修改
    selectItemParamAll:"/api/backend/itemParam/selectItemParamAll",  //规格参数查询
    paramsSearch:"/api/params/search", //规格参数模糊查询
    paramsTotal:"/api/paramsTotal", //规格参数总条数
    paramsDelete:"/api/params/paramDelete", //规格参数删除
    statistical:"/api/statistical", //统计数据--销售信息
    sellTotal:"/api/sellTotal" //月度销售额
}

export default base;
