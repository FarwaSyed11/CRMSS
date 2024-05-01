using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for ImageProcessor
/// </summary>
public class ImageProcessor
{
    /// <summary>
    /// Initializes a new instance of the <see cref="ImageProcessor"/> class.
    /// </summary>
    public ImageProcessor()
    {        
    }

    /// <summary>
    /// Displays the image.
    /// </summary>
    /// <param name="CaptureId">The capture identifier.</param>
    /// <param name="Operator">The operator.</param>
    /// <returns>DataTable.</returns>
    public DataTable DisplayImage(int CaptureId, int Operator)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@UserID", CaptureId);
        param[1] = new SqlParameter("@opr", Operator);        
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_DisplayPic");
        if (ds != null)
            return ds.Tables[0];
        else
            return null;
    }

    /// <summary>
    /// Deletes the image.
    /// </summary>
    /// <param name="CaptureId">The capture identifier.</param>
    /// <param name="Operator">The operator.</param>
    /// <returns>Integer.</returns>
    public int DeleteImage(int CaptureId, int Operator)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@UserID", CaptureId);
        param[1] = new SqlParameter("@opr", Operator);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParamUnis(param, "sp_DisplayPic");
        if (ds != null)
            return 1;
        else
            return 0;
    }
}



