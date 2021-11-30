package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pds");
		int maxSize = 1024 * 1024 * 20;
		String encoding = "utf-8";
		MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = mr.getFileNames();
		String originfName = "";
		String sysfName = "";
		while (fileNames.hasMoreElements()) {
			String file = (String) fileNames.nextElement();
			if (mr.getOriginalFileName(file) != null) {
				originfName += mr.getOriginalFileName(file) + "/";
				sysfName += mr.getFilesystemName(file)+ "/";
			}
		}
		
		String mid = "";
		String pwd = "";
		String nickName = "";
		String title = "";
		String part = "";
		String contetn = "";
		String opewnSw = "";
		int fSize = 0;
		if (mr.getParameter("mid") != null) {
			mid = mr.getParameter("mid");
		}
		if (mr.getParameter("nickName") != null) {
			nickName = mr.getParameter("nickName");
		}
		if (mr.getParameter("pwd") != null) {
			pwd = mr.getParameter("pwd");
		}
		if (mr.getParameter("title") != null) {
			title = mr.getParameter("title");
		}
		if (mr.getParameter("part") != null) {
			part = mr.getParameter("part");
		}
		if (mr.getParameter("contetn") != null) {
			contetn = mr.getParameter("contetn");
		}
		if (mr.getParameter("openSw") != null) {
			opewnSw = mr.getParameter("openSw");
		}
		if (mr.getParameter("fSize") != null) {
			fSize = Integer.parseInt(mr.getParameter("fSize"));
		}
		SecurityUtil su = new SecurityUtil();
		pwd = su.encryptSHA256(pwd);
		
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(originfName);
		vo.setfSName(sysfName);
		vo.setfSize(fSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setContent(contetn);
		vo.setOpewnSw(opewnSw);
		vo.setPwd(pwd);
		
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInputOk(vo);
		
		if (res != 0) {
			request.setAttribute("msg", "pdsInputOk");
			request.setAttribute("url", "pdsList.pds");
		}
		else {
			request.setAttribute("msg", "No");
			request.setAttribute("url", "pdsInput.pds");
		}
	}

}
