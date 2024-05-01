using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for crmProjectMaster
/// </summary>
public class crmProjectMaster
{
	public crmProjectMaster()
	{
		//
		// TODO: Add constructor logic here
		//
        
	}
    public class ProjectItemResult
    {
        /// <summary>
        /// Collection of AssetRestItem objects.
        /// </summary>
      
        public IEnumerable<RootObject> RootObjects { get; set; }

    }
    public class items
    {
        /// <summary>
        /// Primary Key.
        /// </summary>


        public long Id { get; set; }

        public String RecordName { get; set; }

        public String CreatedBy { get; set; }

        public DateTime CreationDate { get; set; }

        public String City_c { get; set; }

        public String Client_c { get; set; }

        public String Country_c { get; set; }

        public String Developer_c { get; set; }

        public String MainConsultant_c { get; set; }

        public String MainContractor_c { get; set; }

        public String MEPConsultant_c { get; set; }

        public String Owner_c { get; set; }

        public String PlotNo_c { get; set; }

        public String ProjectType_c { get; set; }

        public String ProjectSubtype_c { get; set; }

        public String ProjectNo_c { get; set; }

        public String Stage_c { get; set; }

        public String ProjectStatus_c { get; set; }

        public String LastUpdatedBy { get; set; }

        public DateTime LastUpdateDate { get; set; }

        public String Company_c { get; set; }

        public long? MEPConsultant_Id_c { get; set; }

        public String RecordNumber { get; set; }

        public String OwnerOfMainContractor_c { get; set; }

        public long? RecordId_c { get; set; }

        public String ProjectScale_c { get; set; }

        public String DeveloperOwner_c { get; set; }

        public String SourceOfInfomartion_c { get; set; }

        public String SourceName_c { get; set; }

        public String ImageUrl_c { get; set; }

        public String ConstructionType_c { get; set; }

        public long? Owner_Id_c { get; set; }

        public long? MainContractor_Id_c { get; set; }
        public long? Developer_Id_c { get; set; }
        public long? DeveloperOwner_Id_c { get; set; }

    }

    public class RootObject
    {
        public List<items> items { get; set; }
        public DateTime LookupDate { get; set; }
    }
}