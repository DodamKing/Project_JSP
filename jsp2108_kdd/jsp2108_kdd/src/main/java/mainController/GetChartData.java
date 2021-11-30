package mainController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import requestJson.HttpURLConnectionGetJson;
import requestJson.SongVO;

public class GetChartData implements MaInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpURLConnectionGetJson songs = new HttpURLConnectionGetJson();
		ArrayList<SongVO> vos = songs.getSong();
		
		request.setAttribute("vos", vos);
	}

}
