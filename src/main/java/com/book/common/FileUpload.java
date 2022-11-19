package com.book.common;

import com.book.bean.BookVO;
import com.book.dao.BookDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileUpload {
    public BookVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        BookVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, realPath,
                    sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");

            one = new BookVO();
            String sid = multipartRequest.getParameter("sid");
            if (sid != null && !sid.equals("")) one.setSid(Integer.parseInt(sid));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setPublisher(multipartRequest.getParameter("publisher"));
            one.setPrice(multipartRequest.getParameter("price"));
            one.setPages(multipartRequest.getParameter("pages"));
            one.setSizes(multipartRequest.getParameter("sizes"));
            one.setWeight(multipartRequest.getParameter("weight"));
            one.setTopic(multipartRequest.getParameter("topic"));

            if (sid != null && !sid.equals("")) {
                BookDAO dao = new BookDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if (filename != null && oldfilename != null)
                    FileUpload.deleteFile(request, oldfilename);
                else if (filename == null && oldfilename != null)
                    filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if (f.exists()) f.delete();
    }
}
