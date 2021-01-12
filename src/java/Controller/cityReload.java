/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Models.City;
import Services.CityServices.CityService;
import Services.CityServices.CityServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;


public class cityReload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cityReload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String selectValue = request.getParameter("value");
        
        PrintWriter out = response.getWriter();
        CityService cityService = new CityServiceImpl();
        List<City> list = cityService.selectCities(selectValue);
        String htmlCode = "";
        for(int i = 0; i < list.size(); i++){
            String code = "<option value='"+ list.get(i).getCityCode() + "'>" + list.get(i).getCityName() + "</option>";
            htmlCode += code;
        }
        out.write(htmlCode);        
    }
    
    private class CityData{
        private String cityName;
        private String cityCode;

        public CityData() {
            cityName = "";
            cityCode = "";
        }

        public CityData(String cityName, String cityCode) {
            this.cityName = cityName;
            this.cityCode = cityCode;
        }

        public String getCityName() {
            return cityName;
        }

        public void setCityName(String cityName) {
            this.cityName = cityName;
        }

        public String getCityCode() {
            return cityCode;
        }

        public void setCityCode(String cityCode) {
            this.cityCode = cityCode;
        }
        
        
        
    }
}
