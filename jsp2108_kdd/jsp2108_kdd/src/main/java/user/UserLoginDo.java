package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import song.SongDAO;
import song.SongVO;

public class UserLoginDo implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String userId = "";
		String pwd = "";
		
		if (request.getParameter("userId") != null) {
			userId = request.getParameter("userId");
		}
		
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		
		UserDAO userDAO = new UserDAO();
		SongDAO songDAO = new SongDAO();
		
		pwd = pwd.toUpperCase();
		int pwdKeyNo = userDAO.getKeyNo(userId);
		long pwdKey = userDAO.getKey(pwdKeyNo);
		long intPwd;
		String strPwd = "";
		
		for (int i=0; i<pwd.length(); i++) {
			intPwd = pwd.charAt(i);
			strPwd += intPwd;
		}
		
		intPwd = Long.parseLong(strPwd);
		long encPwd = intPwd ^ pwdKey;
		pwd = String.valueOf(encPwd);
		
		
		if (userDAO.login(userId, pwd)) {
			request.setAttribute("res", "loginSuccess");
			request.setAttribute("url", "today");
			
			UserVO vo = userDAO.getUserVO(userId);
			String playList;
			String[] arrPlayList;
			ArrayList<Integer> intPlayList = new ArrayList<Integer>();
			ArrayList<SongVO> vos = new ArrayList<SongVO>();
			HttpSession session = request.getSession();
			
			playList = userDAO.getPlayList(userId);
			if (!playList.equals("")) {
				arrPlayList = playList.split("/");
				
				for (int i=0; i<arrPlayList.length; i++) {
					intPlayList.add(Integer.parseInt(arrPlayList[i]));
				}
				
				vos = songDAO.getSongvos(intPlayList);
				session.setAttribute("sPlaylist", vos);
			}
			
			session.setAttribute("sVO", vo);
			session.setAttribute("sMid", userId);
			
		}
		else {
			request.setAttribute("res", "loginFalse");
			request.setAttribute("url", "userlogin.user");
		}
	}

}
