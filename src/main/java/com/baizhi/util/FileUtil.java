package com.baizhi.util;

import javazoom.jl.decoder.Bitstream;
import javazoom.jl.decoder.BitstreamException;
import javazoom.jl.decoder.Header;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;

public class FileUtil {
    public static String saveFile(MultipartFile file, String address, HttpServletRequest request) throws IOException {
        String fileName = file.getOriginalFilename();
        String name = UUID.randomUUID().toString();
        String filename = name+""+fileName;
        String realPath = request.getSession().getServletContext().getRealPath(address);
        file.transferTo(new File(realPath, filename));

        return address+""+filename;
    }
    public static void deleteFile(String imgPath,HttpServletRequest request){
        String realPath = request.getSession().getServletContext().getRealPath(imgPath);
        File file = new File(realPath);
        if(file.exists()){
            file.delete();
        }else{
            throw new RuntimeException("文件不能为空！");
        }
    }
    public static String udpateFile(MultipartFile file,String yPath,String address,HttpServletRequest request) throws IOException {
        deleteFile(yPath,request);
        String saveFile = saveFile(file, address, request);
        return saveFile;
    }
    //检测文件大小和时长
    public static String AudioLength(String filename,HttpServletRequest request) throws LineUnavailableException, IOException, UnsupportedAudioFileException {

        String realPath = request.getSession().getServletContext().getRealPath(filename);
        FileInputStream fis;
        int time = 0;
        try {
            fis = new FileInputStream(new File(realPath));
            int b = fis.available();
            Bitstream bt = new Bitstream(fis);
            Header h = bt.readFrame();
            time = (int) h.total_ms(b);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (BitstreamException e) {
            e.printStackTrace();

        }
        int min = time/1000/60; //s
        int second = time/1000%60;
//      System.out.println("mp3时长为:"+i+"s");
        return min+"分"+second+"秒";

    }
    public static Double AudioSize(String filename,HttpServletRequest request) throws LineUnavailableException, IOException, UnsupportedAudioFileException {

        String realPath = request.getSession().getServletContext().getRealPath(filename);
        File file = new File(realPath);
        long size = file.length();
        long l = size / 1024 ;
        Double aDouble = Double.valueOf(l);
        Double size1 = aDouble/1024;
        Double dou = (double)Math.round(size1*100)/100;
        return dou;
    }
}
