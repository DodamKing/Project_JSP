package member;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemJoinOkcommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = "";
		String pwd = "";
		String nickName = "";
		String name = "";
		String name_ = "";
		String gender = "";
		String birthday = "";
		String tel = "";
		String tel1 = "";
		String tel2 = "";
		String tel3 = "";
		String address = "";
		String email = "";
		String email1 = "";
		String email2 = "";
		String homePage = "";
		String job = "";
		String[] hobbys;
		String hobby = "";
		String content = "";
		String userInfor = "";
		
		
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/data/member");
		int maxSize = 1024 * 1024 * 2;
		String encoding = "utf-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		if (multipartRequest.getParameter("mid") != null) {
			mid = multipartRequest.getParameter("mid").trim();
		}
		if (multipartRequest.getParameter("pwd") != null) {
			pwd = multipartRequest.getParameter("pwd").trim();
		}
		if (multipartRequest.getParameter("nickName") != null) {
			nickName = multipartRequest.getParameter("nickName").trim();
		}
		if (multipartRequest.getParameter("name") != null) {
			name = multipartRequest.getParameter("name").trim();
		}
		name_ = name;
		if (multipartRequest.getParameter("gender") != null) {
			gender = multipartRequest.getParameter("gender").trim();
		}
		if (multipartRequest.getParameter("birthday") != null) {
			birthday = multipartRequest.getParameter("birthday").trim();
		}
		if (multipartRequest.getParameter("tel1") != null) {
			tel1 = multipartRequest.getParameter("tel1").trim();
		}
		if (multipartRequest.getParameter("tel2") != null) {
			tel2 = multipartRequest.getParameter("tel2").trim();
		}
		if (multipartRequest.getParameter("tel3") != null) {
			tel3 = multipartRequest.getParameter("tel3").trim();
		}
		tel = tel1 + "-" + tel2 + "-" + tel3;
		if (multipartRequest.getParameter("address") != null) {
			address = multipartRequest.getParameter("address").trim();
		}
		if (multipartRequest.getParameter("email1") != null) {
			email1 = multipartRequest.getParameter("email1").trim();
		}
		if (multipartRequest.getParameter("email2") != null) {
			email2 = multipartRequest.getParameter("email2").trim();
		}
		email = email1 + "@" + email2;
		if (multipartRequest.getParameter("homePage") != null) {
			homePage = multipartRequest.getParameter("homePage").trim();
		}
		if (multipartRequest.getParameter("job") != null) {
			job = multipartRequest.getParameter("job").trim();
		}
		if (multipartRequest.getParameter("userInfor") != null) {
			userInfor = multipartRequest.getParameter("userInfor");
		}
		hobbys = multipartRequest.getParameterValues("hobby");
		for (int i=0; i<hobbys.length; i++) {
			hobby += hobbys[i] + "/";
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		if (request.getParameter("content") != null) {
			content = multipartRequest.getParameter("content").trim();
		}
		
		
		String photo = multipartRequest.getParameter("photo");
		if (!photo.equals("music.png")) {
			photo = multipartRequest.getFilesystemName("fName");
		}
		
		MemberDAO dao = new MemberDAO();
		
		name = dao.idCheck(mid);
		if (!name.equals("")) {
			request.setAttribute("msg", "idCheckOk");
			request.setAttribute("url", request.getContextPath() + "/memJoin.mem");
			return;
		}
		
		pwd = pwd.toUpperCase();
		
		int pwdKey;
		long encPwd;
		long intPwd;
		long pwdValue;
		String strPwd = "";

		for (int i=0; i<pwd.length(); i++) {
			intPwd = (long) pwd.charAt(i);
			strPwd += intPwd;
		}
		
		pwdKey = (int) (Math.random( ) * 20);
		pwdValue = dao.getHashTableSearch(pwdKey);
		
		intPwd = Long.parseLong(strPwd);
		
		encPwd = intPwd ^ pwdValue; //키 값으로 암호화 시키는 중 인코딩
		strPwd = String.valueOf(encPwd);
		
		MemberVo vo = new MemberVo();
		vo.setMid(mid);
		vo.setPwd(strPwd);
		vo.setPwdKey(pwdKey);
		vo.setNickName(nickName);
		vo.setName(name_);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberJoinOk(vo);
		
		if (res != -1) {
			request.setAttribute("msg", "memJoinOk");
			request.setAttribute("url", request.getContextPath() + "/memLogin.mem");
		}
		else {
			request.setAttribute("msg", "memJoinNo");
			request.setAttribute("url", request.getContextPath() + "/memJoin.mem");
		}
	}

}
