$(document).ready(function() {
	$(".listimage img").each(setImage);
});
var imgFlag = false; // 鼠标放在图片上标记
var divFlag = false; // 鼠标放在删除层上标记
var index = 0;

function setImage() {
	var divObj = $("<div onclick=removeGroupNotActivitySharingPhotoByResourceCode('"
			+ $(this).attr('alt')
			+ "'); onmouseover=divOnmouseover('"
			+ $(this).attr('alt')
			+ "'); onmouseout=divOnmouseout('"
			+ $(this).attr('alt')
			+ "'); data-content='"
			+ $(this).attr('alt')
			+ "'>×</div>");
	divObj.addClass("divX");
	divObj.attr("title", "删除该图片");
	divObj.css({
		position : "absolute",
		left : $(this).position().left + 60,
		top : $(this).position().top
	});
	$(this).parent().append(divObj);
};

function showDeleteDiv(resourceCode) {
	imgFlag = true;
	$("div[data-content='" + resourceCode + "']").css("display", "block");
};

function hideDeleteDiv(resourceCode) {
	if (!imgFlag && !divFlag) {
		$("div[data-content='" + resourceCode + "']").css("display", "none");
	}
};

function imgOnmouseout() {
	imgFlag = false;
};

function divOnmouseover(resourceCode) {
	divFlag = true;
	showDeleteDiv(resourceCode);
};

function divOnmouseout(resourceCode) {
	divFlag = false;
	if (imgFlag) {
		showDeleteDiv(resourceCode);
	} else {
		hideDeleteDiv(resourceCode);
	}
};

function previewPhoto(resourceCode) {
	alert("查看图片" + resourceCode);
};

function removeGroupNotActivitySharingPhotoByResourceCode(resourceCode) {
	$("img[alt='" + resourceCode + "']").parent().detach();
}