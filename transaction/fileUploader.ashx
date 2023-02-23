<%@ WebHandler Language="C#" Class="fileUploader" %>

//*
using System;
using System.Web;
using System.IO;
public class fileUploader : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string dirFullPath = HttpContext.Current.Server.MapPath("~/user_upload/");
            string[] files;
            int numFiles;
            files = System.IO.Directory.GetFiles(dirFullPath);
            numFiles = files.Length;
            numFiles = numFiles + 1;
            string str_image = "";

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    str_image = "myfile" + numFiles.ToString() + fileExtension;
                    string pathToSave_100 = HttpContext.Current.Server.MapPath("~/user_upload/") + str_image;
                    file.SaveAs(pathToSave_100);
                }
            }
            //database record

            context.Response.Write(str_image);
        }
        catch { }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}
//*