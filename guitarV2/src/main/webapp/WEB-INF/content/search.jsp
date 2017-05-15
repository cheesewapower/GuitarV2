<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/public/backpublic.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>吉他店</title>
 <script type="text/javascript">
     $(document).ready(function(){
    	
    	 
    	 //搜索
    	    $("#searchBtn").click(function(){
    	    	 var builder=$('#builder').val();
    	    	 var model=$('#model').val();
    	    	 var type=$('#type').val();
    	    	 var backWood=$('#backWood').val();
    	    	 var topWood=$('#topWood').val();
    	    	if($('input[name="model"]').val()!=''&&$('input[name="builder"]').val()!=''&&$('input[name="type"]').val()!=''&&$('input[name="backWood"]').val()!=''&&$('input[name="topWood"]').val()!=''){
    	    	$.ajax({	
    	    		url:'guitar_queryAllGuitar.action',
    				type:'POST',
    				data:{	
    				builder:builder,
    				model:model,
    				type:type,
    				backWood:backWood,
    				topWood:topWood
    				},
    				success:function(data){    
    					console.log(data);
    				},
    			})
    	    	}else{
    	    		swal("请完整的输入条件");
    	    	}
    			
    	    })//click	
     
     
     	});
    
     	
    </script>

</head>
<body>
<form  role="form"  method="post">
        <div>
            <label>builder</label>
        </div>
        <input type="text" name="builder" id ="builder">
        <div>
            <label>model</label>           
        </div>
         <input type="text" name="model" id ="model">
        <div>
            <label>type</label>
        </div>
        <input type="text" name="type" id ="type">
        <div>
            <label>backWood</label>
        </div>
        <input type="text" name="backWood" id ="backWood">
        <div>
            <label>topWood</label>
        </div>
        <input type="text" name="topWood" id ="topWood">
    </form>
     <button type="submit" id="searchBtn">查询</button>
</body>
</html>