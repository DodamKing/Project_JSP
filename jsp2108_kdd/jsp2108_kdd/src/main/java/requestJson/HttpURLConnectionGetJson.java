package requestJson;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

import song.SongDAO;

public class HttpURLConnectionGetJson {
	JSONArray songs;
	
	public HttpURLConnectionGetJson() {
		
		final String HOST_URL = "http://127.0.0.1:5000/DDChart";
//		final String HOST_URL = "218.236.203.156:5000/DDChart";
		HttpURLConnection conn = null;
		
		try {
			URL url = new URL(HOST_URL);
			conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("auth", "myAuth");
			conn.setDoOutput(true);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String sb = new String();
			String line = null;
			
			while ((line = br.readLine()) != null) {
				sb += line;
			}
			
			
			JSONObject object = new JSONObject(sb);
			songs = object.getJSONArray("songs");
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	SongDAO dao = new SongDAO();
	// json을 바로 vo에 담을 수도 있음
	public ArrayList<SongVO> getSong() {
		Gson gson = new Gson();
		ArrayList<SongVO> vos = new ArrayList(); 
		
		for (int i=0; i<songs.length(); i++) {
			SongVO vo = new SongVO();
			vo = gson.fromJson(songs.getJSONObject(i).toString(), SongVO.class);
			int idx = dao.getSongIdx(vo.getTitle(), vo.getArtist());
			vo.setIdx(idx);
			vos.add(vo);
		}
		return vos;
	}
}
