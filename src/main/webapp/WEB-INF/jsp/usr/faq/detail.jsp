<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="FAQ DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<hr />

<section class="mt-24 text-xl px-4">
    <div class="mx-auto">
        <table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
            <tbody>
                <tr>
                    <th style="text-align: center;">ID</th>
                    <td style="text-align: center;">${article.id}</td>
                </tr>
                <tr>
                    <th style="text-align: center;">Registration Date</th>
                    <td style="text-align: center;">${article.regDate.substring(0,10)}</td>
                </tr>
                <tr>
                    <th style="text-align: center;">Modified Date</th>
                    <td style="text-align: center;">${article.updateDate.substring(0,10)}</td>
                </tr>
                <tr>
                    <th style="text-align: center;">Board ID</th>
                    <td style="text-align: center;">${article.boardId}</td>
                </tr>
                <tr>
                    <th style="text-align: center;">Writer</th>
                    <td style="text-align: center;">${article.extra__writer}</td>
                </tr>
                <tr>
                    <th style="text-align: center;">Title</th>
                    <td style="text-align: center;">${article.title}</td>
                </tr>
                <tr>
                    <th style="text-align: center;">Body</th>
                    <td style="text-align: center;">${article.body}</td>
                </tr>
                <!-- 답변 표시 -->
                <tr>
                    <th style="text-align: center;">Answer</th>
                    <td style="text-align: center;">
                        <c:choose>
                            <c:when test="${not empty article.answer}">
                                ${article.answer} <!-- 답변이 있는 경우 표시 -->
                            </c:when>
                            <c:otherwise>
                                <span style="color: gray;">답변 대기 중</span> <!-- 답변이 없는 경우 표시 -->
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="btns mt-4">
            <button class="btn" type="button" onclick="history.back()">뒤로가기</button>
            
            <!-- 수정 버튼 -->
            <c:if test="${article.userCanModify }">
                <a class="btn" href="../faq/modify?id=${article.id }">수정</a>
            </c:if>
            
            <!-- 삭제 버튼 -->
            <c:if test="${article.userCanDelete }">
                <a class="btn" href="../faq/doDelete?id=${article.id }" 
                   onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
            </c:if>

            <!-- 관리자 답변 추가 버튼 -->
            <c:if test="${user.isAdmin}">
                <a class="btn" href="../faq/answer?id=${article.id }">답변 작성</a>
            </c:if>
        </div>
    </div>
</section>

<%@ include file="../common/foot.jspf"%>
