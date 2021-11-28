package mainController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import song.SongDAO;
import song.SongVO;
import user.UserDAO;

@WebServlet("/today")
public class DDtoday extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "/WEB-INF/view/main.jsp";
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		if (mid != null) {
			UserDAO userDAO = new UserDAO();
			SongDAO songDAO = new SongDAO();
			
			String playList; 
			String[] arrPlayList; 
			ArrayList<Integer> intPlayList = new ArrayList<Integer>(); 
			ArrayList<SongVO> vos = new ArrayList<SongVO>();
			playList = userDAO.getPlayList(mid); 
			
			if (!playList.equals("")) {
				arrPlayList = playList.split("/");
				
				for (int i=0; i<arrPlayList.length; i++) {
					intPlayList.add(Integer.parseInt(arrPlayList[i])); 
					}
				
				vos = songDAO.getSongvos(intPlayList); 
				session.setAttribute("sPlaylist", vos);
			}
		  }
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
