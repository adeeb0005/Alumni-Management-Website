/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.Helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author adeeb
 */
public class Helper {
    public static boolean deleteFile(String path){
        boolean f = false;
        try{
            File file = new File(path);
            file.delete();
            f = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public static boolean saveFile(InputStream is, String path){
        boolean f = false;
        try{
            byte b[] = new byte[is.available()];
            is.read(b);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            f = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public static boolean renameFile(String path, String id){
        boolean f = false;
        try{
            Path source = Paths.get(path);
            int index = path.lastIndexOf('.');
            String extension = path.substring(index + 1);
            Files.move(source, source.resolveSibling(id+"."+extension));
            f = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
