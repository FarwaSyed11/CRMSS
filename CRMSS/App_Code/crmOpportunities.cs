using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for crmOpportunities
/// </summary>
public class crmOpportunities
{
	public crmOpportunities()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public class OppertunityItemResult
    {
        /// <summary>
        /// Collection of AssetRestItem objects.
        /// </summary>
        public IEnumerable<items> OppertunityItems { get; set; }
        public IEnumerable<RootObject> RootObjects { get; set; }

    }

    /// <summary>
    /// Asset class returned by API.
    /// </summary>
    public class items
    {
        /// <summary>
        /// Primary Key.
        /// </summary>


        public String OptyNumber { get; set; }

        public long OptyId { get; set; }
        public String Name { get; set; }

        public String OwnerText_c { get; set; }

        public long OwnerResourcePartyId { get; set; }

        public String SalesStage { get; set; }


        public String StatusCode { get; set; }

        public DateTime CreationDate { get; set; }


        public String CreatedBy { get; set; }

        public String LastUpdatedBy { get; set; }

        public DateTime LastUpdateDate { get; set; }

        public String ProjectNo_c { get; set; }

        public String TargetPartyName { get; set; }

        public String MEPConsultant_c { get; set; }

        public String MainContractor_c { get; set; }

        public String Client_c { get; set; }


        public double? WinProb { get; set; }

        public String MarketingName_c { get; set; }

        public bool? FinalPrice_c { get; set; }

        public double? FinalPriceAmount_c { get; set; }

        public String FinalPriceRemarks_c { get; set; }

        public DateTime? FinalPriceDate_c { get; set; }

    }
    public class RootObject
    {
        public List<items> items { get; set; }

        //	public List<RevenueItems> RevenueItems { get; set; }
        public DateTime LookupDate { get; set; }
    }
}