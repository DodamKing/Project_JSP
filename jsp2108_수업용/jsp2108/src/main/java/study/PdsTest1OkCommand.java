package study;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PdsTest1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/data/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "utf-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		String fileSystemName = multipartRequest.getFilesystemName("fName");
		
		if (fileSystemName != null) {
			request.setAttribute("msg", "fileOk");
		}
		else {
			request.setAttribute("msg", "No");
		}
		
		request.setAttribute("url", "pdsTest1.st");
	}

}
