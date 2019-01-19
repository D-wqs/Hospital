//jquery入口函数
$(function(){
    // 获取当前屏幕高度
    var Height=$(window).height();
    console.log("当前屏幕的高度：",Height);
    //jquery通过attr函数设置属性;s
    $(".jumbotron").css("height",Height);
    console.log("获取body的属性：",$("body").height());
    //当移动鼠标时，使主页导航栏在某一位置定住（自带标签，没用到，无需导入）
    $(window).scroll(function() {
		if($(document).scrollTop() >= 200) {
			$("#D_nav").css({"position":"fixed","width":"100%"});
		} else {
			$("#D_nav").css("position","");
		}
	});
});