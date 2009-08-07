/*
 * Copyright 1999, 2000, 2001 ,2004 The Apache Software Foundation.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.tester;


import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


/**
 * Verify that request and response wrappers added by a Filter are in fact
 * visible to the called servlet.
 *
 * @author Craig R. McClanahan
 * @version $Revision$ $Date$
 */

public class FilterRequest02 extends HttpServlet {

    public void service(HttpServletRequest request,
                        HttpServletResponse response)
        throws IOException, ServletException {

        response.setContentType("text/plain");
        PrintWriter writer = response.getWriter();

        String dispatch = request.getParameter("dispatch");
        if ("F".equals(dispatch)) {
            RequestDispatcher rd =
                getServletContext().getRequestDispatcher("/FilterRequest02a");
            if (rd == null)
                writer.println("FilterRequest02 FAILED - No forward request dispatcher");
            else
                rd.forward(request, response);
        } else if ("I".equals(dispatch)) {
            RequestDispatcher rd =
                getServletContext().getRequestDispatcher("/FilterRequest02a");
            if (rd == null)
                writer.println("FilterRequest02 FAILED - No include request dispatcher");
            else
                rd.include(request, response);
        } else {
            String wrap = request.getParameter("wrap");
            if ("false".equals(wrap)) {
                if (request instanceof TesterHttpServletRequestWrapper)
                    writer.println("FilterRequest02 FAILED - Request was wrapped");
                else
                    writer.println("FilterRequest02 PASSED");
            } else if ("/WrappedFilterRequest02".equals(request.getServletPath())) {
                if (request instanceof TesterHttpServletRequestWrapper)
                    writer.println("FilterRequest02 PASSED");
                else
                    writer.println("FilterRequest02 FAILED - Wrapper class is "
                                   + request.getClass().getName());
            }
        }

        while (true) {
            String message = StaticLogger.read();
            if (message == null)
                break;
            writer.println(message);
        }
        StaticLogger.reset();

    }

}
