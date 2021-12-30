<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="extras.DatabaseManager"%>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>

<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
String email = session.getAttribute("email").toString();
if(email==null)return;
String book_ids = request.getParameter("productinfo");
String book_names = request.getParameter("book_names");
int total_price = Integer.parseInt(request.getParameter("amount"));
String email1= request.getParameter("email");
String user_name = request.getParameter("firstname");
String payment_method = request.getParameter("payment_method");
String address = request.getParameter("address");
int zipcode = Integer.parseInt(request.getParameter("zipcode"));
DatabaseManager databaseManager = new DatabaseManager();
databaseManager.createConnection();
if(payment_method !=null){
if(payment_method.equals("cash")) {
try {
	databaseManager.executeUpdate("insert into orders(book_ids,book_names,total_price,email,user_name,payment_method,address,zipcode,status) values('"+book_ids+"','"+book_names+"','"+total_price+"','"+email1+"','"+user_name+"','"+payment_method+"','"+address+"','"+zipcode+"','ordered')");
	databaseManager.executeUpdate("delete from cart where email='"+email+"'");
	

	
	System.out.println("Order Successfully");
	response.sendRedirect("message.jsp");
	return;
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

}

}













	String merchant_key="UTxH20iO";
	String salt="yMmckJLJ9k";
	String action1 ="";
	String base_url="https://sandboxsecure.payu.in";
	int error=0;
	String hashString="";
	
 

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
     String   udf2 = txnid;
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>
<html>

<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == '')
		return;

      var payuForm = document.forms.payuForm;
      payuForm.submit();
  
}
</script>

<body onload="submitPayuForm();">
 

<form action="<%= action1 %>" method="post" name="payuForm">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
	  <input type="hidden" name="service_provider" value="payu_paisa" />
 
          <td><input type="hidden" name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" /></td>
          <td><input type="hidden" name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" /></td>
          <td><input type="hidden" name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" /></td>
          <td><input type="hidden" name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" /></td>
          <td colspan="3"><input type="hidden" name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo") %>" size="64" /></td>
          <td colspan="3"><input type="hidden" name="surl" value="https://reeadeasy.herokuapp.com/PaymentSuccess" size="64" /></td>
          <td colspan="3"><input name="furl" type="hidden" value="https://reeadeasy.herokuapp.com/PaymentUnsuccess" size="64" /></td>
          <td><input name="lastname" id="lastname" type="hidden" value="<%= (empty(params.get("lastname"))) ? "" : params.get("lastname") %>" /></td>
          <td><input type="hidden" name="curl" value="" /></td>
          <td><input name="address1" type="hidden" value="<%= (empty(params.get("address1"))) ? "" : params.get("address1") %>" /></td>
          <td><input name="address2" type="hidden" value="<%= (empty(params.get("address2"))) ? "" : params.get("address2") %>" /></td>
          <td><input name="city" type="hidden" value="<%= (empty(params.get("city"))) ? "" : params.get("city") %>" /></td>
          <td><input name="state" type="hidden" value="<%= (empty(params.get("state"))) ? "" : params.get("state") %>" /></td>
          <td><input name="country" type="hidden" value="<%= (empty(params.get("country"))) ? "" : params.get("country") %>" /></td>
          <td><input name="zipcode" type="hidden" value="<%= (empty(params.get("zipcode"))) ? "" : params.get("zipcode") %>" /></td>
          <td><input name="udf1" type="hidden" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" /></td>
          
          <td><input name="udf3" type="hidden" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" /></td>
          <td><input name="udf4" type="hidden" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" /></td>
          <td><input name="udf5" type="hidden" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" /></td>
          <td><input name="pg" type="hidden" value="<%= (empty(params.get("pg"))) ? "" : params.get("pg") %>" /></td>
    </form>
    <h2>Redirecting To Payment GateWay.....</h2>

<%
try {
	if(payment_method !=null){

ResultSet rs = databaseManager.executeQuery("select order_id from orders order by order_id desc limit 1");
rs.next();
int order_id = rs.getInt("order_id")+1;
Cookie ck = new Cookie("order_id",Integer.toString(order_id));
databaseManager.executeUpdate("insert into orders(book_ids,book_names,total_price,email,user_name,payment_method,address,zipcode,status) values('"+book_ids+"','"+book_names+"','"+total_price+"','"+email+"','"+user_name+"','"+payment_method+"','"+address+"','"+zipcode+"','payment_pending')");
}
} catch (ClassNotFoundException e) {
// TODO Auto-generated catch block
e.printStackTrace();
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
databaseManager.closeConnection();
%>
<script type="text/javascript">
var payuForm = document.forms.payuForm;
payuForm.submit();
</script>
</body>
</html>