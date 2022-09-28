package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 *通过设置过滤器避免中文乱码的问题
 */
@WebFilter(filterName = "AvoidChineseGibberish" ,urlPatterns = "/**")
public class AvoidChineseGibberish implements Filter {
    // 过滤器对象在初始化时调用，可以配置一些初始化参数
    public void init(FilterConfig config) throws ServletException {
    }

    // 过滤器对象在销毁时自动调用，释放资源
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //设置请求的编码
        request.setCharacterEncoding("utf-8");
        //设置响应的编码
        response.setContentType("text/html;charset=utf-8");
        //使过滤器进行下个目标资源的调用
        chain.doFilter(request, response);
    }
}
