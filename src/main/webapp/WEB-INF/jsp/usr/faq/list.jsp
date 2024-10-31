<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="FAQ LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
    /* 전체 화면 검은색 배경 */
    html, body {
        background-color: #121212;
        color: #f5f5f5;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
    }
    
    #main-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        padding: 20px;
        box-sizing: border-box;
    }

    hr {
        border-color: #333;
    }
    .table {
        background-color: #1e1e1e;
        border: 1px solid #333;
        color: #f5f5f5;
        border-radius: 8px;
        width: 100%;
        max-width: 900px;
        margin: 0 auto;
    }
    th, td {
        padding: 12px;
        border-bottom: 1px solid #333;
        text-align: center;
    }
    th {
        font-weight: bold;
        color: #ffffff;
        background-color: #333;
    }
    .hover:hover {
        background-color: #333;
        transition: background-color 0.3s ease;
    }
    .btn {
        background-color: #333;
        color: #f5f5f5;
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 14px;
    }
    .btn:hover {
        background-color: #555;
        transition: background-color 0.3s ease;
    }
    .btn-primary {
        background-color: #0066ff;
        color: #ffffff;
    }
    .btn-primary:hover {
        background-color: #0055cc;
    }
    .pagination .btn-active {
        background-color: #0066ff;
        color: #ffffff;
    }
    /* 검색 필드 스타일 */
    input[type="text"], select {
        background-color: #f5f5f5;
        color: #121212;
        border: 1px solid #555;
        padding: 8px;
        border-radius: 4px;
        margin-right: 8px;
    }
    input[type="text"]::placeholder {
        color: #888;
    }
    .search-button {
        background-color: #0066ff;
        color: #ffffff;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
    }
    .search-button:hover {
        background-color: #0055cc;
    }
</style>

<div id="main-content">
    <section class="mt-24 text-xl px-4">
        <div class="mx-auto">
            <div class="mb-4 flex">
                <div>${articlesCount}개</div>
                <div class="flex-grow"></div>
                <form action="">
                    <input type="hidden" name="boardId" value="${param.boardId}" />
                    <div class="flex">
                        <select class="select select-sm select-bordered max-w-xs" name="searchKeywordTypeCode" data-value="${param.searchKeywordTypeCode}">
                            <option value="title">Title</option>
                            <option value="body">Body</option>
                            <option value="title,body">Title+Body</option>
                            <option value="nickname">Nickname</option>
                        </select>
                        <label class="flex items-center gap-2">
                            <input type="text" placeholder="Search" name="searchKeyword" value="${param.searchKeyword}" />
                            <button type="submit" class="search-button">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4">
                                    <path fill-rule="evenodd" d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z" clip-rule="evenodd" />
                                </svg>
                            </button>
                        </label>
                    </div>
                </form>
            </div>

            <table class="table" cellspacing="0" cellpadding="5">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Registration Date</th>
                        <th>Title</th>
                        <th>Writer</th>
                        <th>Answer</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="faq" items="${articles}">
                        <tr>
                            <td>${faq.id}</td>
                            <td>${faq.regDate.substring(0,10)}</td>
                            <td><a class="hover:underline" href="detail?id=${faq.id}">${faq.title}</a></td>
                            <td>${faq.extra__writer}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty faq.answer}">
                                        ${faq.answer}
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: gray;">답변 완료
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty articles}">
                        <tr>
                            <td colspan="5" style="text-align: center; color: gray;">게시글이 없습니다</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <div class="pagination flex justify-center mt-3">
            <div class="btn-group">
                <c:forEach begin="1" end="${pagesCount}" var="i">
                    <a class="btn btn-sm ${param.page == i ? 'btn-active' : ''}" href="${baseUri}&page=${i}">${i}</a>
                </c:forEach>
            </div>
        </div>

        <div class="flex justify-end mt-6">
            <a href="/usr/faq/write" class="btn btn-primary">FAQ 작성</a>
        </div>
    </section>
</div>

<%@ include file="../common/foot.jspf" %>
