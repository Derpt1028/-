package utils;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

public class FileTools {
    /**
     * 文件上传
     * @param part Servlet3.0及以上版本的文件上传对象
     * @param filepath 文件上传的路径
     * @throws IOException
     * @return 返回上传的文件名
     */
    public static String fileUpload(Part part, String filepath) throws IOException {
        //获取上传文件名
        String filename=part.getSubmittedFileName();
        //上传文件按时间戳新命名
        String newFilename = System.currentTimeMillis() + filename.substring(filename.lastIndexOf("."));
        //创建文件上传路径对象
        File file = new File(filepath);
        //如果路径不存在
        if(!file.exists()){
            file.mkdirs();//创建路径目录
        }
        //上传文件到指定路径
        part.write(filepath+"/"+newFilename);
        //返回上传文件名
        return newFilename;
    }

}