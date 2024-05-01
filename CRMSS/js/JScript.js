   function PrintIt(){
 
    var tbl=document.createElement('table');
    var tr=document.createElement('tr');
    var td=document.createElement('td');
    var tr1=document.createElement('tr1');
    var td1=document.createElement('td1');
    
    
    var myspan = document.getElementById('ctl00_FormView1_lbl_coName0').firstChild.data;  
        td.innerHTML=myspan;
        var one,two,three,four,five;
        
        if(document.getElementById('ctl00_FormView1_Label11'))
         one=document.getElementById('ctl00_FormView1_Label11').firstChild.data;
        else
        one=" ";
        
         if(document.getElementById('ctl00_FormView1_Label12').firstChild==null)
        two=""; 
        else
         two=document.getElementById('ctl00_FormView1_Label12').firstChild.data;
        
        if(document.getElementById('ctl00_FormView1_Label13').firstChild==null)        
        three=""; 
        else
         three=document.getElementById('ctl00_FormView1_Label13').firstChild.data;
        
        if(document.getElementById('ctl00_FormView1_Label14').firstChild==null)
        four=""; 
        else
         four=document.getElementById('ctl00_FormView1_Label14').firstChild.data;
        
        if(document.getElementById('ctl00_FormView1_Label15').firstChild==null)
        five="";
        else
         five=document.getElementById('ctl00_FormView1_Label15').firstChild.data;
        
         var myspan1 = one+"&nbsp;"+two+"&nbsp;"+three+"&nbsp;"+four+"&nbsp;"+five;  
        td1.innerHTML=myspan1;
          
tr.appendChild(td);
tbl.appendChild(tr);

tr1.appendChild(td1);
tbl.appendChild(tr1);


//tbl.setAttribute('border','1');
document.getElementById("prnt").appendChild(tbl);
 var div1=document.createElement('div');
 div1.setAttribute('style','margin-top:30px;')
 div1.innerHTML='<span  id="bill" style="margin-left:0px;">'+ document.getElementById("ctl00_ContentPlaceHolder1_tb_date").value+'</span>';
document.getElementById("prnt").appendChild(div1);
 
window.print();

return false;
}

function prnt()
    {
    document.getElementById("hdr").style.display="block";
    window.print();
    }
    
    function prntStat()
    {
    document.getElementById("hdr").style.display="block";
    window.print();
    }
    
  function prntJV()
    {
    document.getElementById("hdr").style.display="block";
  document.getElementById('c11').style.display='none';
document.getElementById('c12').style.display='none';
document.getElementById('c13').style.display='none';
document.getElementById('c14').style.display='none';
document.getElementById('c15').style.display='none';
document.getElementById('c16').style.display='none';
document.getElementById('c17').style.display='none';

    var v1=document.getElementById('ctl00_ContentPlaceHolder1_ddl1');
    var v2=document.getElementById('ctl00_ContentPlaceHolder1_ddl2');
    var v3=document.getElementById('ctl00_ContentPlaceHolder1_ddl3');
    var v4=document.getElementById('ctl00_ContentPlaceHolder1_ddl4');
    var v5=document.getElementById('ctl00_ContentPlaceHolder1_ddl5');
   var check=document.getElementById('tr2').value;

    if(v1.value=="0")
   
       document.getElementById('tr2').style.display='none';  
    
    if(v2.value=="0")

    document.getElementById('tr3').style.display='none';
    
    if(v3.value=="0")

    document.getElementById('tr4').style.display='none';
    
    if(v4.value=="0")
  
    document.getElementById('tr5').style.display='none';


    if(v5.value=="0")

    document.getElementById('tr6').style.display='none';
if(document.getElementById('ctl00_ContentPlaceHolder1_ddl_bank').value=="0")
document.getElementById('ctl00_ContentPlaceHolder1_ddl_bank').style.display='none';

    window.print();
    }
    
    function Button1_onclick() {
 var dr1=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb1").value);
 var dr2=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb2").value);
 var dr3=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb3").value);
 var dr4=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb4").value);
 var dr5=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb5").value);
 var dr=Math.round(dr1+dr2+dr3+dr4+dr5);
 
 var cr1=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb6").value);
 var cr2=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb7").value);
 var cr3=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb8").value);
 var cr4=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb9").value);
 var cr5=Number(document.getElementById("ctl00_ContentPlaceHolder1_tb10").value);
 var cr=Math.round(cr1+cr2+cr3+cr4+cr5);
 document.getElementById("ctl00_ContentPlaceHolder1_tb_drTotal").value=dr;
 document.getElementById("ctl00_ContentPlaceHolder1_tb_crTotal").value=cr;
 
return false;
}