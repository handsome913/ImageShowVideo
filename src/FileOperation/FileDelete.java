package FileOperation;

import java.io.File;
import java.util.ArrayList;

public class FileDelete {
    private final String filepath="C:\\Users\\Genius Cheng\\IdeaProjects\\ImageShowVideo\\out\\artifacts\\ImageShowVideo_Web_exploded\\photos\\";

    public void DeleteFile(String filename){
        File file =new File(this.filepath+filename);
        if(file.exists()) {
            file.delete();
        }
    }
    public void DeleteFileList(ArrayList<String> FileInfo){
        for(String filename:FileInfo) {
           DeleteFile(filename);
        }
    }
}
