// const song_list = []
const thum_list = []
const title_list = []
const artist_list = []

let songUrl;
let playerIndex = 0;
let sw = 0;

<c:forEach var="vo" items="${sPlaylist}"> 
	thum_list.push("${vo.img}");
    title_list.push("${vo.title}");
    artist_list.push("${vo.artist}");
</c:forEach>

// 플레이 리스트 추가
$("button[name='add_btn']").click(function() { 
    let topIndex = $("button[name='add_btn']").index(this);
    let thum = $("img[name='top100Img']")[topIndex].src;
    let title = $("div[name='top100Title']")[topIndex].innerText;
    let artist = $("div[name='top100Artist']")[topIndex].innerText;

	if (!thum_list.includes(thum)) {
	    thum_list.push(thum);
	    title_list.push(title);
	    artist_list.push(artist);
	
	    setList();
	
		data = {
			title : title,
			artist : artist
		}
	
		$.ajax({
			type : "post",
			url : "usersaveplaylist.user",
			data : data
		});
	}

});


// 플레이 리스트 음원 삭제
function delList(index) {
	data = {
		title : title_list[index],
		artist : artist_list[index]
	}
	
    thum_list.splice(index, 1);
    title_list.splice(index, 1);
    artist_list.splice(index, 1);
    
    setList();

	if (index <= playerIndex) {
		playerIndex--;
	}
	
	$.ajax({
		type : "post",
		url : "userdelplaylist.user",
		data : data
	});
	
}

// 플레이 리스트에 데이터 뿌리기
function setList() {
	let res = "";
	
    for (let i=0; i<thum_list.length; i++) {
        res += "<div class='d-flex p-1'><div class='imgBox mr-4'><img src='" + thum_list[i] + "'></div><div><div class='playlist_t' title='" + title_list[i] + "'>" + title_list[i] + "</div><div class='playlist_a' title='" + artist_list[i] + "'>" + artist_list[i] + "</div></div><div class='ml-auto'><button name='delete_btn' type='button' class='btn' onclick='delList(" + i + ")' ><i class='fa-regular fa-trash-can'></i></button></div></div>";
	}
	
    play_list.innerHTML = res;
}

// 로드
function load() {
	let title = title_list[playerIndex].replace(/[\\\/:*?\"<>|]/g, "");
	let artist = artist_list[playerIndex].replace(/[\\\/:*?\"<>|]/g, "");

	let hostIndex = location.href.indexOf(location.host) + location.host.length;
	let contextPath = location.href.substring(hostIndex, location.href.indexOf("/", hostIndex + 1));

    songUrl = contextPath + "/music/" + title + " - " + artist + ".mp3";
	player.src = songUrl;
    player.load();
    controls_img.src = thum_list[playerIndex];
    controls_title.innerHTML = title_list[playerIndex];
    controls_artist.innerHTML = artist_list[playerIndex];
    controls_title.title = title_list[playerIndex];
    controls_artist.title = artist_list[playerIndex];
	play_listImg_img.src = thum_list[playerIndex].replace("50", "600");
}


// 플레이버튼 클릭
play_btn.addEventListener("click", () => {
	if (thum_list[0] == null) {
		return;
	}
	
	else {
	    if (sw == 0) {
			load();
	        sw = 1;
	    }
	    
    $(play_btn).hide();
    $(pause_btn).show();
    player.play();	
	}
});

// 일시정지
pause_btn.addEventListener("click", () => {
    $(play_btn).show();
    $(pause_btn).hide();
    player.pause();
});

//볼륨
$("#volume_bar").on("input", () => {
	player.volume = $("#volume_bar").val() / 100;
});

// 음소거
let temp_vol;
$("#mute_btn1").click(() => {
	temp_vol = player.volume;
	player.volume = 0;
	volume_bar.value = 0;
	
    $("#mute_btn1").hide();
    $("#mute_btn2").show();
});

$("#mute_btn2").click(() => {
	player.volume = temp_vol;
	volume_bar.value = temp_vol * 100;
	
    $("#mute_btn2").hide();
    $("#mute_btn1").show();
});

//재생바
$("#player").on("timeupdate", () => {
	let per = (player.currentTime / player.duration) * 100;
	$("#play_bar").val(per);
 	
	let min_dur = 00;
	let sec_dur = 00;
	let min_cur = 00;
	let sec_cur = 00;

	if (!isNaN(player.duration)) {
	    min_dur = parseInt(player.duration / 60);
	    sec_dur = parseInt(player.duration % 60);
	    min_cur = parseInt(player.currentTime / 60);
	    sec_cur = parseInt(player.currentTime % 60);
	}

    
    if (min_dur < 10) {
        min_dur = "0" + min_dur;
    }
    if (sec_dur < 10) {
        sec_dur = "0" + sec_dur;
    }
    if (min_cur < 10) {
        min_cur = "0" + min_cur;
    }
    if (sec_cur < 10) {
        sec_cur = "0" + sec_cur;
    }

    let res = min_cur + ":" + sec_cur + " / " + min_dur + ":" + sec_dur;
    $("#controls_time").html(res);

	if (${empty sMid} || ${sVO.membership == 0}) {
		if (${empty sMembership || sMembership == 0}) {
			if (player.currentTime > 60 && player.currentTime < player.duration) {
				player.currentTime = player.duration;
			}
		}
	}
});


// 재생바 이동
$("#play_bar").on("change", () => {
	let point = $("#play_bar").val();
    play_bar = point;
    player.currentTime = point * player.duration / 100;
});

// next button
$("#next_btn").click(() => {
	playerIndex++;
	if (playerIndex >= thum_list.length) {
		playerIndex = 0;
	};
	load();
	player.play();
	$("#controls_time").html("00:00 / 00:00");
});


// back button
$("#back_btn").click(() => {
	playerIndex--;
	if (playerIndex <= 0) {
		playerIndex = 0;
	};
	load();
	player.play();
	$("#controls_time").html("00:00 / 00:00");
});

// 연속 재생
$("#player").on("ended", () => {
	playerIndex++;
	if (playerIndex >= thum_list.length) {
		$(play_btn).show();
    	$(pause_btn).hide();
		playerIndex = 0;
		sw = 0;
		return;
	}

	load();
	player.play();
});

//가사 모달
$("#lyrics_btn").click(() => {
	modal_i.src = controls_img.src.replace("50","200");
	$("#modal_t").html($("#controls_title").html());
	$("#modal_a").html($("#controls_artist").html());
	
	if (controls_img.src.includes("music.png")) return;
			
	let data = {
		title : $("#controls_title").html(),
		artist : $("#controls_artist").html()
	}
	
	$.ajax({
		type : "post",
		url : "solyrics.so",
		data : data,
		success : (data) => {
			data = data.replace(/\n/g, "<br>");
			$("#modal_c").html(data);
		}
	});
	
});




