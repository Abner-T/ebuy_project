<template>
    <div ref="editorWang" style="text-align: left">
    </div>
</template>

<script>
    import wangEditor from 'wangeditor'
    export default {
        name: "ProductWangEditor",
        data(){
            return{
                editor:null, //editor对象
                editorData:'' //承载编辑器数据
            }
        },
        props:{
            currentEditorData:{
                type:String,
                default:''
            }
        },
        watch:{
          currentEditorData(newVal){
              this.editor.txt.html(newVal)
          }
        },
        mounted() {
            this.editor=new wangEditor(this.$refs.editorWang);
            //配置onchange回调函数，将数据同步到vue中
            this.editor.config.onchange=(newHtml)=>{
                this.editorData=newHtml;
                this.$emit("onEditor",this.editorData)
            };

            //自定义菜单配置
            this.editor.config.menus=[
                'head',
                'bold',
                'fontSize',
                'fontName',
                'italic',
                'underline',
                'strikeThrough',
                'foreColor',
                'backColor',
                'link',
                'list',
                'justify',
                'quote',
                'emoticon',
                'image',
                'table',
                'code',
                'undo',
                'redo',
            ]

            this.editor.create();
        },
        beforeDestroy() {
            this.editor.destroy(); // 组件销毁时，及时销毁 editor ，重要！！！
            this.editor=null;
        }
    }
</script>

<style scoped>

</style>
