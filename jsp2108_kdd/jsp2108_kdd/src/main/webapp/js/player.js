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
    if (sw == 0) {
        songUrl = "../music/" + title_list[playerIndex] + " - " + artist_list[playerIndex] + ".mp3";
        // songUrl = "./" + title_list[playerIndex] + " - " + artist_list[playerIndex] + ".mp3";
        // player.src = decodeURIComponent(songUrl);
        player.src = songUrl;
        player.load();
        controls_img.src = thum_list[playerIndex];
        controls_title.innerHTML = title_list[playerIndex];
        controls_artist.innerHTML = artist_list[playerIndex];
        sw = 1;
    }
    
    $(play_btn).hide();
    $(pause_btn).show();
    player.play();
});

// 일시정지
pause_btn.addEventListener("click", () => {
    $(play_btn).show();
    $(pause_btn).hide();
    player.pause();
});