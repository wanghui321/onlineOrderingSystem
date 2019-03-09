
/**
 * 保存
 */

function saveInfo(){
	$.ajax({
        type:"POST",
        url:"admin/saveInfo",
        data:$("#form").serialize(),
        async: false,
        success:function(data){
        	if(data == DATA_STATE_FAIL){
            	layer.msg("操作失败！");
                parent.TableInit.refTable('bootTable');
            }else if(data == DATA_STATE_UPDATE){
            	layer.msg("修改成功！");
                parent.TableInit.refTable('bootTable');
            }else{
            	layer.msg("保存成功！");
            	parent.TableInit.refTable('bootTable');
            	window.location.href=jumpEditPage("passportId",data);
            }
        }
    });
	
	/*var bootstrapValidator = $("#form").data('bootstrapValidator');
    //手动触发验证
    bootstrapValidator.validate();
    
    if(bootstrapValidator.isValid()){
    	$.ajax({
            type:"POST",
            url:"/passport/saveInfo",
            data:$("#form").serialize(),
            async: false,
            success:function(data){
            	if(data == DATA_STATE_FAIL){
	            	layer.msg("操作失败！");
	                parent.TableInit.refTable('bootTable');
	            }else if(data == DATA_STATE_UPDATE){
	            	layer.msg("修改成功！");
	                parent.TableInit.refTable('bootTable');
	            }else{
	            	layer.msg("保存成功！");
	            	parent.TableInit.refTable('bootTable');
	            	window.location.href=jumpEditPage("passportId",data);
	            }
            }
        });
    }else{
    	return;
    }*/
}



