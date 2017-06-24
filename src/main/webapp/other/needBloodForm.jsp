<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.js"></script>

<style>
* {
	margin: 0
}

.fieldOutside {
				width: 500px; /*要比div寬*/
				border-radius: 20px; /*圓角*/
				margin: 20px;
				border: 3px solid gray;
				background-color: #D2E9FF;
			}
			
.fieldInside {
				width: 500px; /*要比div寬*/
				border-radius: 20px; /*圓角*/
				margin: 20px;
				border: 1px solid 	#E0E0E0
			}

.div1 {
	width: 450px;
	margin: 5px;
	padding-bottom: 5px
}
.divSub{
widtih: 450px;
margin:20px;
text-align: center;
}

.title1 {
	width: 120px; /*做浮動一定要給寬度讓其依循*/
	float: left; /*如果用right文字會跑到輸入格右邊*/
	text-align: right; /*姓名.密碼.意見區塊向右靠齊*/
	padding-right: 10px
}
</style>
</head>
<body>



	<form action="needBlood.controller" method="post">
	
		<fieldset class="fieldOutside">
		<legend style="color:#0080FF;font-size:20px; text-align:right;text-indent: 2px">徵求基本資料填寫</legend>
		<fieldset class="fieldInside">
			<div class="div1">
				<label class="title1">寵物名:</label><select id="selectPetName"></select>
			</div>
			
			<div class="div1">
				<label class="title1">種類:</label>
				<select id="selectSpecies">
				<option value="dog" selected>狗</option>
				<option value="cat">貓</option>
				</select> 
		 	</div>
		 	
			<div class="div1">
				<label class="title1">體重(公斤):</label><input type="text" name="species" placeholder="10"/> 
			</div>
			
			<div class="div1">
				<label class="title1">需要血型:</label>
				<select id="selectBloodType"><option value="">請選擇血型</option></select> 
			</div>	
			
			<div class="div1">
				<label class="title1">需要血量(毫升):</label><input type="text" name="needCC" placeholder="250"/> 
			</div>
			
			<div class="div1">
				<label class="title1">需求截止日:</label><input type="date" name="date"> 
			</div>
			
			<div class="div1">
				<label class="title1">所在縣市:</label>
				<select id="selectCity">
				<option>請選擇縣市 </option>
				</select> 
			</div>
			
			</fieldset>
			<fieldset class="fieldInside">
			<div class="div1">
				<label class="title1">連絡人姓名:</label><input type="text" name="contactPerson"> 
			</div>
			
			<div class="div1">
				<label class="title1">電話:</label><input type="text" name="contactNum" />
			</div>
			
			<div class="div1">
				<label class="title1">Line ID:</label><input type="text" name="lineId" /> 
			</div>
			
			<div class="div1">
				<label class="title1">配對醫院:</label><input type="text" name="hospitalName" /> 
			</div>
			
			<div class="div1">
				<label class="title1">醫院地址:</label><input type="text" name="hospitalAddr" size="59px"/> 
			</div>
			
			
			
			</fieldset>
			
			<fieldset class="fieldInside">
			<div class="div1">	
				<label class="title1">備註:</label><textarea rows="20" cols="40" name="content"></textarea>
			</div>
			
				<div class="divSub">
						<input type="submit" value="送出" style="font-size:30px">
						<input type="reset" value="清除" style="font-size:30px">
					</div>
			</fieldset>
		</fieldset>
	</form>
	
	

	<script>

$(function () {

var docFragmentForPetName = $(document.createDocumentFragment());
$.get("GetPetName.view",{},function(datas){
	$.each(datas,function(idx,values){
		var option = $("<option></option>").attr('value',values.petName).append(values.petName);
		docFragmentForPetName.append(option);
	});//each end
	$("#selectPetName").append(docFragmentForPetName);
	}) //get end

	
	var docFragmentForBT = $(document.createDocumentFragment());
	$.getJSON('BloodType.json',{},function(datas){
		$.each(datas,function(idx,bloodType){
		if(bloodType.dog){ //如果迴圈是跑到dog才要執行
			var option = $("<option></option>").attr('value',bloodType).append(bloodType.dog);
			docFragmentForBT.append(option);
	     	}
		});//each end
		
		$("#selectBloodType").append(docFragmentForBT);
		});//getJSON end
	

var docFragmentForloca = $(document.createDocumentFragment());
		$.getJSON('locations.json',{},function(datas){
			$.each(datas,function(idx,locations){
				var option = $("<option></option>").attr('value',locations.city).append(locations.city);
				docFragmentForloca.append(option);
			});//each end
			$("#selectCity").append(docFragmentForloca);
		
			});//getJSON end


	
	
	$("#selectSpecies").change(function(){
		if($("#selectSpecies option:selected").val() == "dog"){ //如果種類選的是狗
			$("#selectBloodType").empty(); //清空元素內容
			var docFragmentForDog = $(document.createDocumentFragment());
			$.getJSON('BloodType.json',{},function(datas){
				$.each(datas,function(idx,bloodType){
					if(bloodType.dog){
					var option = $("<option></option>").attr('value',bloodType.dog).append(bloodType.dog);
					docFragmentForDog.append(option);
					}
				});//each end
				$("#selectBloodType").append(docFragmentForDog);	
				
				});//getJSON end
		}
		
		if($("#selectSpecies option:selected").val() == "cat"){
			$("#selectBloodType").empty(); //清空元素內容
			var docFragmentForCat = $(document.createDocumentFragment());
			$.getJSON('BloodType.json',{},function(datas){
				$.each(datas,function(idx,bloodType){
					if(bloodType.cat){
					var option = $("<option></option>").attr('value',bloodType.cat).append(bloodType.cat);
					docFragmentForCat.append(option);
					}
				});//each end
			
				$("#selectBloodType").append(docFragmentForCat);
			
				});//getJSON end
		}
		
	
		
	});
	
})//ready end


</script>

</body>
</html>