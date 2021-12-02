package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = 1;
		int idx = 0;
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getPdsContent(idx);
		
		String realPath = request.getServletContext().getRealPath("/data/pds/");
		String zipPath = request.getServletContext().getRealPath("/data/pds/temp/");
		String zipName = vo.getTitle() + ".zip";
		
		String[] fSNames = vo.getfSName().split("/");
		String[] fNames = vo.getfName().split("/");
		
		FileInputStream fis;
		FileOutputStream fos;
		ZipOutputStream zos;
		ServletOutputStream sos;
		
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		for (int i=0; i<fSNames.length; i++) {
			File file = new File(realPath + fSNames[i]);
			/* File file_ = new File(zipPath + zipName); */
			File file_ = new File(zipPath + fNames[i]);
			
			file.renameTo(file_);
			fis = new FileInputStream(file_);
			try {
				zos.putNextEntry(new ZipEntry(fNames[i]));
			}
			catch (Exception e) {
				/*
				 * String fName = fNames[i].substring(0, fNames[i].lastIndexOf(".")); String ext
				 * = fNames[i].substring(fNames[i].lastIndexOf(".")); zos.putNextEntry(new
				 * ZipEntry(fName + "(" + no +")" + ext));
				 */
				zos.putNextEntry(new ZipEntry(fNames[i].split("[.]")[0] + "(" + no +")." + fNames[i].split("[.]")[1]));
				no++;
			} 
			
			byte[] b = new byte[2048];
			int data = 0;
			
			while ((data = fis.read(b, 0, b.length)) != -1) {
				zos.write(b, 0, data);
			}
			zos.flush();
			zos.closeEntry();
			fis.close();
			
			/* file_.renameTo(file); */
		}
		zos.close();
		
		String mimeType = request.getServletContext().getMimeType(zipName.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");  // 2진 바이너리파일로 전송하겠다는것...
		}
		
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) { // 사용자 브라우저가 익스플로서가 아니라면?
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 다운로드할 파일명과 형식을 헤더파일에 담아서 클라이언트에 전송한다.
		response.setHeader("Content-Disposition", "attachment;filename=" + downLoadName);
		
		// Java에 의해서 실제로 업(다운)로드를 하기위한 객체(FileInputStream/FileOutputStream)를 생성한다.
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		// 생성된 객체에 실제로 파일을 전송처리한다.
		byte[] b = new byte[2048];
		int data = 0;
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		// 여기까지 파일 다운로드 처리이다.

		sos.close();
		fis.close();
		
		new File(zipPath + zipName).delete(); 
		
		dao.setPdsDownUpdate(idx);
	}

}
