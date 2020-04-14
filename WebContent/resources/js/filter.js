$('input[name=filter-sex]').click(function() {
	if ($(this)[0].value == "filter-sex-all") {
		$('input[name=filter-sex]').addClass('radioChk')
		$('input[name=filter-sex]').removeClass('radioChkActive')
		$(this).addClass('radioChkActive')
	} else if ($(this)[0].value == "filter-sex-female") {
		$('input[name=filter-sex]').addClass('radioChk')
		$('input[name=filter-sex]').removeClass('radioChkActive')
		$(this).addClass('radioChkActive')
	} else if ($(this)[0].value == "filter-sex-male") {
		$('input[name=filter-sex]').addClass('radioChk')
		$('input[name=filter-sex]').removeClass('radioChkActive')
		$(this).addClass('radioChkActive')
	}
})

$('#filter-age-all').click(
		function() {
			if ($(this)[0].value == "filter-age-all") {
				console.log($(this)[0].value)
				$('#filter-age-all').prop("checked", true).removeClass(
						"chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-age]').prop("checked", false).removeClass(
						"chkboxChkActive").addClass("chkboxChk");
			}
		})

$('input[name=filter-age]').click(
		function() {
			var chk = document.getElementsByName('filter-age');
			var chkAll = document.getElementById('filter-age-all');
			var count = 0;
			$('#filter-age-all').prop("checked", false).removeClass(
					"chkboxChkActive").addClass("chkboxChk");
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					chk[i].classList.add("chkboxChkActive")
					count++;
				}
				if (!chk[i].checked) {
					chk[i].classList.remove("chkboxChkActive")
					chk[i].classList.add("chkboxChk")
				}
			}
			if (count == chk.length) {
				$('input[name=filter-age]').prop("checked", false).removeClass(
						"chkboxChkActive")
				$('#filter-age-all').prop("checked", true).addClass(
						"chkboxChkActive");
			} else if (count == 0) {
				$('#filter-age-all').prop("checked", true).addClass(
						"chkboxChkActive");
			}
		})

$('#filter-skinType-all').click(
		function() {
			if ($(this)[0].value == "filter-skinType-all") {
				console.log($(this)[0].value)
				$('#filter-skinType-all').prop("checked", true).removeClass(
						"chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-skinType]').prop("checked", false)
						.removeClass("chkboxChkActive").addClass("chkboxChk");
			}
		})

$('input[name=filter-skinType]').click(
		function() {
			var chk = document.getElementsByName('filter-skinType');
			var chkAll = document.getElementById('filter-skinType-all');
			var count = 0;
			$('#filter-skinType-all').prop("checked", false).removeClass(
					"chkboxChkActive").addClass("chkboxChk");
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					chk[i].classList.add("chkboxChkActive")
					count++;
				}
				if (!chk[i].checked) {
					chk[i].classList.remove("chkboxChkActive")
					chk[i].classList.add("chkboxChk")
				}
			}
			if (count == chk.length) {
				$('input[name=filter-skinType]').prop("checked", false)
						.removeClass("chkboxChkActive")
				$('#filter-skinType-all').prop("checked", true).addClass(
						"chkboxChkActive");
			} else if (count == 0) {
				$('#filter-skinType-all').prop("checked", true).addClass(
						"chkboxChkActive");
			}
		})

$('#reset-btn').click(
		function() {
			$('input[name=filter-sex]').addClass('radioChk').removeClass(
					"radioChkActive")
			$("#filter-sex-all").prop("checked", true).addClass(
					"radioChkActive")
			$('#filter-age-all').prop("checked", true).removeClass("chkboxChk")
					.addClass("chkboxChkActive");
			$('input[name=filter-age]').prop("checked", false).removeClass(
					"chkboxChkActive").addClass("chkboxChk");
			$('#filter-skinType-all').prop("checked", true).removeClass(
					"chkboxChk").addClass("chkboxChkActive");
			$('input[name=filter-skinType]').prop("checked", false)
					.removeClass("chkboxChkActive").addClass("chkboxChk");
		})

// 화장품 셀렉트
$(function() {
	$('.middle-category').css('display', 'none')
	$('#skincare').css('display', 'block');
	$('#skincare').attr("name", "middle");
})

$('#cosmetic-big-category').click(function() {
	var t = document.getElementById('cosmetic-big-category')
	if (t.value == '스킨케어') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#skincare').css('display', 'block');
		$('#skincare').attr("name", "middle");
	} else if (t.value == '클렌징') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#cleansing').css('display', 'block');
		$('#cleansing').attr("name", "middle");
	} else if (t.value == '베이스메이크업') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#base').css('display', 'block');
		$('#base').attr("name", "middle");
	} else if (t.value == '색조메이크업') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#tint').css('display', 'block');
		$('#tint').attr("name", "middle");
	} else if (t.value == '마스크/팩') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#maskPack').css('display', 'block')
		$('#maskPack').attr("name", "middle");
	} else if (t.value == '선케어') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#suncare').css('display', 'block');
		$('#suncare').attr("name", "middle");
	} else if (t.value == '기능성화장품') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#func-cosmetic').css('display', 'block');
		$('#func-cosmetic').attr("name", "middle");
	} else if (t.value == '바디/핸드/풋') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#bodyHandFoot').css('display', 'block');
		$('#bodyHandFoot').attr("name", "middle");
	} else if (t.value == '헤어') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#hair').css('display', 'block');
		$('#hair').attr("name", "middle");
	} else if (t.value == '네일') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#nail').css('display', 'block');
		$('#nail').attr("name", "middle");
	} else if (t.value == '여성용품') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#WomenGoods').css('display', 'block');
		$('#WomenGoods').attr("name", "middle");
	} else if (t.value == '미용렌즈') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#BeautyLens').css('display', 'block');
		$('#BeautyLens').attr("name", "middle");
	} else if (t.value == '향수') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#perfume').css('display', 'block');
		$('#perfume').attr("name", "middle");
	} else if (t.value == '기타제품') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#etc').css('display', 'block');
		$('#etc').attr("name", "middle");
	} else if (t.value == '베이비&맘') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#babyMom').css('display', 'block');
		$('#babyMom').attr("name", "middle");
	} else if (t.value == '바디라인') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#bodyLine').css('display', 'block');
		$('#bodyLine').attr("name", "middle");
	} else if (t.value == '남성화장품') {
		$('.middle-category').css('display', 'none')
		$('.middle-category').attr("name", null);
		$('#man').css('display', 'block');
		$('#man').attr("name", "middle");
	}
})