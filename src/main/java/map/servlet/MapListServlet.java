package map.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import map.repository.MapRepository;

/*
	1. MapRepository에서 지도 정보를 가져옵니다.
	2. Gson을 사용하여 가져온 지도 정보를 JSON 형식의 문자열로 변환합니다.
	3. request 객체에 JSON 형식의 지도 정보를 저장합니다.
	4. map.jsp 페이지로의 이동을 관리하는 RequestDispatcher 객체를 생성합니다.
	5. 현재 요청과 응답을 map.jsp 페이지로 전달하여 클라이언트에게 응답으로 제공합니다.
	6. map.jsp 페이지에서는 maps 속성을 활용하여 JSON 형식의 지도 정보를 추출하고 표시할 수 있습니다.

*/




//map으로 맵핑됨
@WebServlet(name = "mapListServlet", urlPatterns = "/map")
//지도목록을 처리하고, 처리결과를 JSP페이지로 전달하여 응답
public class MapListServlet extends HttpServlet{

	//싱글톤 패턴인 MapRepository를 반환 받아 저장
    private MapRepository mapRepository = MapRepository.getInstance();
    @Override
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//mapRepository.findAll()로 모든 지도 목록을 가져온 후, Gson 라이브러리를 사용하여 JSON으로 변환 -> maps에 할당
    	request.setAttribute("maps", new Gson().toJson(mapRepository.findAll()));
    	
    	//요청을 처리한 후 이동
    	String viewPath = "map.jsp";
    	//getRequestDispatcher를 사용하여 요청에 대한 디스패처를 얻어옴. 이것을 통해 jsp페이지로 이동
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
       
        //forward()메서드를 호출하여 현재의 요청과 응답을 지정된 jsp페이지로 저달
        dispatcher.forward(request, response);
    }
  
}
