package updown;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/download.dong")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileDownload() {
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = request.getParameter("fileName");
		ServletOutputStream out = response.getOutputStream();
		String file_repo = "C:\\file_repo";
		String downFile = file_repo+"\\"+data;
		
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-disposition", "attachment; fileName="+data);
		
		FileInputStream fis = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		
		while(true) {
			int filesize = fis.read(buffer);
			if(filesize == -1) {
				break;
			}
			out.write(buffer,0,filesize);
			fis.close();
			out.close();
		}
		
		
	}
	
	

}
