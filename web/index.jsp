<%-- 
    Document   : index
    Created on : Apr 14, 2020, 12:28:00 PM
    Author     : jianqing
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/WEB-INF/jspf/headtags.jspf" %>
        <title>Econ Cashflow</title>
        <style>
            body
            {

                font-family: 'Overlock', cursive;
            }
            h1, h4
            {
                font-family: 'Cabin Sketch', cursive;
            }
        </style>
    </head>
    <body style="background-image: none;background-color: #ffffcc; ">
        <div class="jumbotron" style="background-color: rgb(151,221,244);">
            <h1><i class="fa fa-star" style="color: blue;"></i>My Business Balance<i class="fa fa-star" style="color: blue;"></i></h1>
            <p>This calculates the net balance and opening bank balance of my business after given time. By Johnson Gao</p>
            <p>Made By Johnson, Economic Teacher: Ms.Eichelberger, Computer Science Teacher: Mr.Ansari/Ms.Nanda</p>
            <p> For Economic Project
                My business information: Time-> 6 mouths,  Cash inflow $1500/mo. Outflow $176/mo. 
            </p>
            ${message}

            <button class="btn btn-primary" ><a href="https://kdocs.cn/l/squAzLPaF?f=101" target="_blank" style="color: white; ">More Information</a></button>
        </div>
        <div class="container" >
            
            <!--Submit get-->
            <form action="index" method="GET">
                <!--6-->
                <p>Please enter number of mo. :   <input type="number" id="numberOfMouths" name="numberOfMouths" required/>
                    &nbsp; &nbsp; 
                    Cash In/mo. <input type="number" name="cashInflow" required /> <!--1500-->
                    Cash out/mo. <input type="number" name="cashOutflow" required /><!--176-->
                    <button class="btn btn-primary" type="submit">Confirm</button></p>
            </form>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Time(Mo.)</th>
                            <th>Opening Bank Balance</th>
                            <th>Cash Inflow</th>
                            <th>Cash Outflow</th>

                            <th>Net Balance</th>
                            <th>Closing Bank Balance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--Creates an instance of the class--%>
                        <%--<jsp:useBean id="cashflowRecordClass" class="utils.CashflowRecord"></jsp:useBean>--%>
                        <c:if test="${param.cashInflow!=null}">

                            <%--<c:set var="record" value="${cashflowRecordClass.createInstance(0,param.cashInflow, param.cashOutflow)}"></c:set>--%>


                            <%--Use a loop to go through the table.--%>

                            <jsp:useBean id="NumberToMouth" class="utils.NumberToMouth"></jsp:useBean>
                            <c:if test="${param.numberOfMouths <= 0}">
                                Please enter a number greater than 0 for number of mouth!
                            </c:if>
                            <c:if test="${param.numberOfMouths>0}">

                                <c:forEach end="${param.numberOfMouths}" begin="1" var="i">
                                    <tr>
                                        <!--The nth mouth-->
                                        <td>${NumberToMouth.convertInt(i)}</td>
                                        <!--Opening bank balance-->
                                        <td><span style="color: blue;">${record.getOpeningBalance()}</span></td>

                                        <td>${record.getCashInflow()}</td>
                                        <!--Cash inflow-->
                                        <td>${record.getCashOutflow()}</td>



                                        <!--Net balance-->
                                        <td>${record.getNetCashflow()}</td>

                                        <!--Closing balance of the mo.-->
                                        <td><span style="color: green;">${record.getClosingBalance()}</span></td>

                                        ${record.nextMouth()}
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </c:if>
                </table>
            </div>
        </div>
    </body>
</html>
