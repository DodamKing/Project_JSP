package mainController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import song.GetSongJson;
import song.SongVO;

public class MachartCommand implements MaInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		GetSongJson getSongs = new GetSongJson();
		ArrayList<SongVO> vos = getSongs.getSong();
		
		request.setAttribute("vos", vos);
	}

}
