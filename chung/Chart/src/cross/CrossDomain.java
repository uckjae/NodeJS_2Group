package cross;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.io.CachedOutputStream;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;

import net.sf.json.JSONObject;


/**
 * Servlet implementation class CrossDomain
 */
@WebServlet("/CrossDomain")
public class CrossDomain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrossDomain() {
        super();
        // TODO Auto-generated constructor stub
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
        String serviceKey = "A8dvXKFhG%2BUeavjNpRHKFWhv%2FqmYLxNXJvSBl77Uo0%2BLcCKhKLCEa9XUq5%2ByKy%2BI%2FjTU9Jjh5o0Mgbdzo4C3CA%3D%3D";
        String parameter = "";
        String parameter2 = "";
        //String datalist="";
        StringBuilder datalist = new StringBuilder();
        PrintWriter out = response.getWriter();
     //&contentTypeId=&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1
    //    parameter = parameter + "&" + "startmonth=201901";
    //    parameter = parameter + "&" + "endmonth=201907";
    //    parameter = parameter + "&" + "region=11000";
    //   parameter = parameter + "&" + "contractType=0";
        parameter = "&contentTypeId=&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12";
        String temp = addr +  serviceKey + parameter;

        datalist.append("[");
     //   for(int i=1; i<-5; i++) {

            parameter2 = "";
            parameter2 = parameter2 + "&" + "pageNo="+1;
            parameter2 = parameter2 + "&" + "_type=json";

            addr = temp + parameter2;
            
            URL url = new URL(addr);
            
            InputStream in = url.openStream();
            CachedOutputStream bos = new CachedOutputStream();
            IOUtils.copy(in, bos);
            in.close();
            bos.close();

            String data = bos.getOut().toString();
        //    String mbos = bos1.toString("UTF-8");
            
   //         byte[] b = mbos.getBytes("UTF-8");
    //        String s = new String(b,"UTF-8");
     //       out.println(s);
            

           datalist.append(data+",");

    //    }
        datalist.append("]");

        /*
         * JSONArray json = new JSONArray(); 
         * json.put("data", datalist);
         */
     //       out.println(data);
            
       //     JSONObject json = new JSONObject();
        //    json.put("data", s);
        final JSONArray json = new JSONArray(datalist.toString());
     //       JSONObject json = new JSONObject();
   //    json.put("data",data);
        out.print(json);

    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			doProcess(request, response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
