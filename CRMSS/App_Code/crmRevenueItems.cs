using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for crmRevenueItems
/// </summary>
public class crmRevenueItems
{
	public crmRevenueItems()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public class revenueItemResult
    {
        /// <summary>
        /// Collection of AssetRestItem objects.
        /// </summary>
        public IEnumerable<Items> revenueItems { get; set; }
        public IEnumerable<RevRootObject> RevRootObject { get; set; }

    }
    public class Items
    {
        /// <summary>
        /// Primary Key.
        /// </summary>

        //RevisionNo_c


        public long OptyId { get; set; }
        public String OptyNumber { get; set; }

        public String ProdGroupName { get; set; }

        public long? ProdGroupId { get; set; }

        public long RevnId { get; set; }

        public long ResourcePartyId { get; set; }

        public String RevnNumber { get; set; }

        public String StatusCode { get; set; }

        public DateTime CreationDate { get; set; }
        public DateTime LastUpdateDate { get; set; }
        public String LastUpdatedBy { get; set; }

        public String QuotationDate_c { get; set; }
        public String QuotationNo_c { get; set; }
        public String SalesOrderDate_c { get; set; }
        public String SalesOrderNo_c { get; set; }
        public String SubStage_c { get; set; }
        public String SubStageDate_c { get; set; }
        public float RevnAmount { get; set; }

        public String Comments { get; set; }

        public String ItemNumber { get; set; }
        public long? InventoryItemId { get; set; }

        public String ProductType { get; set; }


    }
    public class RevRootObject
    {
        public List<Items> items { get; set; }

        //	public List<RevenueItems> RevenueItems { get; set; }
        public DateTime LookupDate { get; set; }
    }
}