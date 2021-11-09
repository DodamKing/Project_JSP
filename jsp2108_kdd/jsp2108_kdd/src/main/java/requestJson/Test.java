package requestJson;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class test {
	public static void main(String[] args) {
final String HOST_URL = "http://127.0.0.1:5000/";
		
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
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			
			System.out.println(sb);
			
//			JSONArray array = new JSONArray(sb.toString());
//			for (int i=0; i<array.length(); i++) {
//				JSONObject obj = array.getJSONObject(i);
//				System.out.println(obj.getString("title"));
//				System.out.println(obj.getString("artist"));
//				System.out.println(obj.getString("img"));
//			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
