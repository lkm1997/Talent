package net.servlet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/jump")
public class JumpController
{

	@RequestMapping("/{id}/{name}")
	public String jumpfront(@PathVariable("id") String id,@PathVariable("name") String name) {
		return id+"/jsp/"+name;
	}
}
