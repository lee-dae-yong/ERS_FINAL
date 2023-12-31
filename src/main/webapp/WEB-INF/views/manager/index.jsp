<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageTitle" value="메인" />
<%@include file="../manager/common/head.jspf" %>

<div class="container-fluid">
  <div class="row" style="height:400px;">
    <!-- 신규대상자 목록 -->
    <div class="col-5">
      <div class="card card-body mt-2" style="border:1px solid gray;height:400px; margin-botton:10px; box-shadow:0.1rem 0.1rem 0.1rem rgba(0,0,0,.3);">
        <div>
          <span class="fs-3" style="border-bottom:2px solid gray; ">신규등록 대상자</span>
          <a href="<%=request.getContextPath()%>/ers/manager/member/main" style="float:right;color:inherit;text-decoration:none;"><i class="bi bi-plus-circle-dotted"></i>&nbsp;더보기</a>
        </div>
        <div class="row" id="memDetail" style="height:80%;margin-top:10px;">
          <!-- 대상자 상세정보 들어갈 자리 -->
          <table class="table table-bordered border-2 mt-1 text-center mem_table">
            <thead style="background-color:#dfdfdf;">
              <tr>
                <th>대상자구분</th>
                <th>대상자명</th>
                <th>등록일</th>
                <th>장비설치</th>
                <th>생활지원사</th>
              </tr>
              <thead>
              <tbody class="table-group-divider">
                <c:forEach var="member" items="${memberList }">
                  <fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd" var="regDate" />
                  <tr onclick="memDetail_go(${member.id});">
                    <td>${member.memType }</td>
                    <td>${member.name }</td>
                    <td style="font-size:0.9rem;">${regDate }</td>
                    <c:if test="${member.machineCk eq 4}">
                      <td style="color:blue;">설치완료</td>
                    </c:if>
                    <c:if test="${member.machineCk ne 4}">
                      <td style="color:red;">미설치</td>
                    </c:if>
                    <c:if test="${empty member.wid }">
                      <td style="color:red;">
                        미배정
                      </td>
                    </c:if>
                    <c:if test="${not empty member.wid }">
                      <td style="color:blue;">
                        배정완료
                      </td>
                    </c:if>
                  </tr>
                </c:forEach>
              </tbody>
          </table>
        </div>
      </div>
    </div>
    <!-- 신규등록 보고서 목록 -->
    <div class="col-7">
      <div class="card card-body  mt-2" style="border:1px solid gray;height:400px;box-shadow:0.1rem 0.1rem 0.1rem rgba(0,0,0,.3);">
        <div>
          <span class="fs-3" style="border-bottom:2px solid gray;">신규등록 보고서</span>
          <a href="<%=request.getContextPath()%>/ers/manager/report/main" style="float:right;color:inherit;text-decoration:none;"><i class="bi bi-plus-circle-dotted"></i>&nbsp;더보기</a>
        </div>
        <div class="row" id="memDetail" style="height:100%;margin-top:15px;">
          <table class="table table-bordered  text-center re_table">
              <thead style="background-color:#dfdfdf;position:sticky;top:0;">
                <tr>
                  <th>보고서번호</th>
                  <th>작성자구분</th>
                  <th>보고서구분</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>열람여부</th>
                </tr>
                <thead>
                <tbody class="table-group-divider" style="overflow:auto;">
                <c:forEach items="${reportList }" var="report">
                  <tr onclick="reportDetail_go();">
                    <td>${report.RNo }</td>
                    <c:if test="${report.WType eq 2 }">
                    <td>응급관리요원</td>
                    </c:if>
                    <c:if test="${report.WType eq 1 }">
                    <td>생활지원사</td>
                    </c:if>
                     <c:if test="${report.reType eq 1 }">
                    <td>응급상황</td>
                    </c:if>
                    <c:if test="${report.reType eq 2 }">
                    <td>고객면담</td>
                    </c:if>
                    <c:if test="${report.reType eq 3 }">
                    <td>건강상태</td>
                    </c:if>
                    <c:if test="${report.reType eq 4 }">
                    <td >서비스취소</td>
                    </c:if>
                    <c:if test="${report.reType eq 5 }">
                    <td >장기부재</td>
                    </c:if>
                    <c:if test="${report.reType eq 6 }">
                    <td >악성대상자신고</td>
                    </c:if>
                    <c:if test="${report.reType eq 7 }">
                    <td>장비점검</td>
                    </c:if>
                    <td>${report.name }</td>
                     <fmt:formatDate value="${report.regDate }" pattern="yyyy-MM-dd" var="regDate" />
                    <td style="font-size:0.8rem;vertical-align:middle;">${regDate }</td>
                    <c:if test="${report.viewCheck eq 0 }">
                    <td>미열람</td>
                    </c:if>
                    <c:if test="${report.viewCheck eq 1 }">
                    <td>열람</td>
                    </c:if>
                  </tr>
                 </c:forEach>
                 
                </tbody>
            </table>
        </div>
      </div>
    </div>
  </div>

<div class="row" >
  <!-- 댁내장비 AS 요청 목록 -->
  <div class="col-7 " style="padding-left:22px;">
    <div class="card card-body mt-3" style="border:1px solid gray;height:250px;box-shadow:0.1rem 0.1rem 0.1rem rgba(0,0,0,.3);">
      <div>
        <span class="fs-3" style="border-bottom:2px solid gray;">댁내장비 AS 요청 내역</span>
        <a href="<%=request.getContextPath()%>/ers/manager/machine/main" style="float:right;color:inherit;text-decoration:none;"><i class="bi bi-plus-circle-dotted"></i>&nbsp;더보기</a>
      </div>
      <div class="row" id="memDetail" style="height:100%;margin-top:5px;background-color:#dfdfdf;">
        <!-- AS 들어갈 자리 -->
        <div class="col-1 h-100 d-flex justify-content-center align-items-center d-none"></div>
        <div class="col-2 h-100 d-flex align-items-center card card-body" style="border:2px solid #aaaaaa;">
          <div class=" w-100 text-center">
            <div class="fs-3 text-light" style="background-color:#4682b4;">서구</div>
            <br>
            <div>&nbsp;<span class="fs-3">${asCount.seocount }</span>&nbsp;건</div>
          </div>
        </div>
        <div class="col-2 h-100 d-flex align-items-center card card-body ms-3" style="border:2px solid #aaaaaa;">
          <div class="w-100 h-100 text-center">
            <div class="fs-3 text-light" style="background-color:#7b68ee">중구</div>
            <br>
            <div>&nbsp;<span class="fs-3">${asCount.joongcount }</span>&nbsp;건</div>
          </div>
        </div>
        <div class="col-2 h-100 d-flex align-items-center card card-body mx-3" style="border:2px solid #aaaaaa;">
          <div class=" w-100 text-center">
            <div class="fs-3 text-light" style="background-color:#2e8b57;">동구</div>
            <br>
            <div>&nbsp;<span class="fs-3">${asCount.dongcount }</span>&nbsp;건</div>
          </div>
        </div>
        <div class="col-2 h-100 d-flex align-items-center card card-body me-3" style="border:2px solid #aaaaaa;">
          <div class=" w-100 text-center">
            <div class="fs-3 text-light" style="background-color:#20b2aa;">유성구</div>
            <br>
            <div>&nbsp;<span class="fs-3">${asCount.ucount }</span>&nbsp;건</div>
          </div>
        </div>
        <div class="col-2 h-100 d-flex align-items-center card card-body" style="border:2px solid #aaaaaa;">
          <div class=" w-100 text-center">
            <div class="fs-3 text-light" style="background-color:#cd5c5c">대덕구</div>
            <br>
            <div>&nbsp;<span class="fs-3">${asCount.deacount }</span>&nbsp;건</div>
          </div>
        </div>
        <div class="col-1 h-100 d-flex align-items-center d-none"></div>
      </div>
    </div>
  </div>
  <!-- 공지사항 -->
  <div class="col-5" >
    <div class="card card-body mt-3" style="border:1px solid gray;height:250px; box-shadow:0.1rem 0.1rem 0.1rem rgba(0,0,0,.3);">
      <div>
        <span class="fs-3" style="border-bottom:2px solid gray;">공지사항</span>
        <a href="<%=request.getContextPath()%>/ers/manager/notice/main" style="float:right;color:inherit;text-decoration:none;"><i class="bi bi-plus-circle-dotted"></i>&nbsp;더보기</a>
      </div>
      <div class="row" id="memDetail" style="margin-top:5px;">
        <!-- 대상자 상세정보 들어갈 자리 -->
        <table class="table table-bordered border-2 mt-1 text-center mem_table">
          <thead style="background-color:#dfdfdf;">
            <tr>
              <th style="width:15%;">번호</th>
              <th style="width:60%;">제목</th>
              <th style="width:25%;">등록일</th>
            </tr>
            <thead>
            <tbody class="table-group-divider">
            <c:forEach var="notice" items="${noticeList }">
            <fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd" var="regDate" />
              <tr>
                <td>${notice.nno } </td>
                <td>${notice.title }</td>
                <td style="font-size:0.9rem;"><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/></td>
              </tr>
            </c:forEach>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</div>




<%@include file="../manager/common/foot.jspf" %>