const song_list = []
const thum_list = []
const title_list = []
const artist_list = []

let songUrl;
let playerIndex = 0;
let sw = 0;

// 플레이 리스트 추가
$("button[name='add_btn']").click(function() {
    let topIndex = $("button[name='add_btn']").index(this);
    let thum = $("section table img")[topIndex].src;
    let title = $("div[name='top10Title']")[topIndex].innerText;
    let artist = $("div[name='top10Artist']")[topIndex].innerText;

    thum_list.push(thum);
    title_list.push(title);
    artist_list.push(artist);

    setList();
    // console.log(thum_list);
});

$("button[name='delete_btn']").click(function() {
    alert("gg");
});

// 플레이 리스트 음원 삭제
function dellist(index) {
    thum_list.splice(index, 1);
    title_list.splice(index, 1);
    artist_list.splice(index, 1);
    
    setList();
}

// 플레이 리스트에 데이터 뿌리기
function setList() {
    let res = "";
    for (let i=0; i<thum_list.length; i++) {
        res += "<div class='d-flex p-1'><div class='imgBox mr-4'><img src='" + thum_list[i] + "'></div><div><div class='playlist_t'>" + title_list[i] + "</div><div class='playlist_a'>" + artist_list[i] + "</div></div><div class='ml-auto'><button name='delete_btn' type='button' class='btn' onclick='dellist(" + i + ")' ><i class='fa-regular fa-trash-can'></i></button></div></div>";
    }
    play_list.innerHTML = res;
}

// 플레이버튼 클릭
play_btn.addEventListener("click", () => {
	if (thum_list[0] == null) {
		return;
	}
	
	else {
    if (sw == 0) {
        songUrl = "../music/" + title_list[playerIndex] + " - " + artist_list[playerIndex] + ".mp3";
        player.src = songUrl;
	console.log(songUrl);
        player.load();
	//console.log("2."+songUrl);
        controls_img.src = thum_list[playerIndex];
        controls_title.innerHTML = title_list[playerIndex];
        controls_artist.innerHTML = artist_list[playerIndex];
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
    play_bar.value = per;

    let min_dur = parseInt(player.duration / 60);
    let sec_dur = parseInt(player.duration % 60);
    let min_cur = parseInt(player.currentTime / 60);
    let sec_cur = parseInt(player.currentTime % 60);
    
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
});

$("#play_bar").on("change", () => {
	let point = $("#play_bar").val();
    play_bar = point;
    player.currentTime = point * player.duration / 100;
});






