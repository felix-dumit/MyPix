function checkPasswords() {
  var password1 = document.getElementById('reg_pw');
  var password2 = document.getElementById('reg_pw2');
  if (password1.value != password2.value) {
    password2.setCustomValidity('Passwords do not match');
  } else {
    password2.setCustomValidity('');
  }
}

function checkDate(){
	
	var date = document.getElementById('reg_dob');
	console.log('Date:'+date.value);
	var m = date.value.search(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$|^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/);
	if(m==-1)
		date.setCustomValidity('Invalid date');
	else date.setCustomValidity('');
		
		
	
}

function createCaptcha(){
//Generates the captcha function    
	var a = Math.ceil(Math.random() * 9)+'';
	var b = Math.ceil(Math.random() * 9)+''; 
	var c = Math.ceil(Math.random() * 9)+'';
 
	var answer =+(a+b) + +(c);
	console.log((''+'a:{0} b:{1} c:{2} ANS:{3}').format(a,b,c,answer));
	document.getElementById("txtCaptcha").value = answer;
	document.getElementById("txtCaptchaDiv").innerHTML = 'Please Answer: {0}{1} + {2} ='.format(a,b,c);	
}

	
// Validate the Entered input aganist the generated security code function   
function checkCaptcha(){
	var val1 = document.getElementById('txtCaptcha');
	var val2 = document.getElementById('txtInput');
	if (val1.value == val2.value){
		val2.setCustomValidity('');	
	}else{
		val2.setCustomValidity('Invalid Captcha');	
	}
}

String.format = String.prototype.format = function() {
    var i=0;
    var string = (typeof(this) == 'function' && !(i++)) ? arguments[0] : this;
 
    for (; i < arguments.length; i++)
        string = string.replace(/\{\d+?\}/, arguments[i]);
 
    return string;
}


function checkLogin(){
	var password = document.getElementById('pw');
	var email = document.getElementById('email');
	
	//if(password.value=='' && email.value!='')alert('yooo');
		
}

function addFileUpload(){

	var newem = document.createElement('div');
	newem.setAttribute('class','fileup');
	newem.setAttribute('style','display:block; margin:10px;');
	newem.innerHTML =
	'<input type="file" accept="image/*" onchange="addImage(this);" id="upimg{0}"/>'.format(++imgCount) +
	'Category:<input type="text" id="tagtext{0}" placeholder="enter category name.." style="width:150px;"/>'.format(imgCount) +
	'<input type="button" id="removeimg{0}" value="Remove" onclick="removeImgUpload(this);" />'.format(imgCount);
	document.getElementById('fileups').appendChild(newem);
	newem.parentNode.appendChild(document.createElement('hr'));
}

function removeImgUpload(e){
	console.log(e);
	var m = e;
	m.parentNode.parentNode.removeChild(m.parentNode.nextElementSibling);
	m.parentNode.parentNode.removeChild(m.parentNode);
	imgCount--;
}

function addImage(img){
	var mimg = img.value.split(/\\/);
	var name="";
	for( var i in mimg){
		name=mimg[i];
	}
	name='img/user/'+name;
	
	var newImg = document.createElement('img');
	newImg.setAttribute('src',name);
	newImg.setAttribute('width','80px');
	console.log(newImg);
	img.parentNode.appendChild(newImg);
	
	imgUploads++;
	
	
}

function uploadImg(){
	alert(imgUploads+' Image(s) Uploaded Successfully');
	imgUploads=0;
	window.location.reload();
}

window.onload=init;
imgCount=1;
imgUploads=0;
function init(){
	if(window.location.toString().indexOf('register')>0){
		createCaptcha();
	}
}