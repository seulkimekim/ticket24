<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예매 상세</title>
    <link rel="stylesheet" type="text/css" href="resources/css/myPage.css">
    <script src="https://kit.fontawesome.com/c3eca5a54c.js" crossorigin="anonymous"></script>
</head>
<body>
    <div id="container">
        <div id="top">
            <div class="myInfo">
                <div class="imgDiv"><img src="../img/myInfo.png" alt="myInfoImg" width="80px"></div>
                <div id="idDiv">
                    <div class="myInfo">
                        <div id="myID">leehy12345</div>
                        <div id="logout"><button>로그아웃</button></div>
                    </div>
                    <div class="aDiv"><a href="<%=ctxPath%>/modifyInfo.action" id="modifyInfo">&nbsp;정보 수정</a></div>
                </div>
            </div>
            <div id="myPoint">
                <img src="../img/point.png" alt="pointImg" width="30px">
                <div class="title">포인트</div>
                <div class="emDiv"><span class="em" id="point">5,970</span>원</div>
            </div>
            <div id="myCoupon">
                <img src="../img/coupon.png" alt="couponImg" width="30px">
                <div class="title">쿠폰</div>
                <div class="emDiv"><span class="em" id="coupon">3</span>개</div>
            </div>
            <div id="myQNA">
                <img src="../img/question.png" alt="qnaImg" width="30px">
                <div class="title">나의 문의</div>
                <div class="emDiv"><span class="em" id="qna">3</span>개</div>
            </div>
        </div>

        <div id="pointDiv">

            <div class="tableTitle">나의 포인트</div>

           <table>
                <thead>
                <tr>
                    <th width="20%">적립일</th>
                    <th width="55%">내용</th>
                    <th width="10%">예매번호</th>
                    <th width="15%">적립포인트</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>2020.08.08 11:11</td>
                    <td class="left">뮤지컬 〈모차르트！〉 10주년 기념공연 주문 적립</td>
                    <td>Y1234567</td>
                    <td class="point">1,000원</td>
                </tr>
                <tr>
                    <td>2020.08.08 11:11</td>
                    <td class="left">뮤지컬 〈모차르트！〉 10주년 기념공연 주문 적립</td>
                    <td>Y1234567</td>
                    <td class="point">1,000원</td>
                </tr>
                <tr>
                    <td>2020.08.08 11:11</td>
                    <td class="left">뮤지컬 〈모차르트！〉 10주년 기념공연 주문 적립</td>
                    <td>Y1234567</td>
                    <td class="point">1,000원</td>
                </tr>
                <tr>
                    <td>2020.08.08 11:11</td>
                    <td class="left">뮤지컬 〈모차르트！〉 10주년 기념공연 주문 적립</td>
                    <td>Y1234567</td>
                    <td class="point">1,000원</td>
                </tr>
                <tr>
                    <td>2020.08.08 11:11</td>
                    <td class="left">뮤지컬 〈모차르트！〉 10주년 기념공연 주문 적립</td>
                    <td>Y1234567</td>
                    <td class="point">1,000원</td>
                </tr>
                </tbody>
            </table>

            <div class="pageBar">
                <a href="" class="pageBtn prevFist"></a>
                <a href="" class="pageBtn prev"></a>
                <em class="pageLink">1</em>
                <a href="" class="pageLink">2</a>
                <a href="" class="pageLink">3</a>
                <a href="" class="pageBtn next"></a>
                <a href="" class="pageBtn nextLast"></a>
            </div>
        </div>

        <div id="couponDiv">
            <div class="tableTitle">나의 쿠폰</div>

            <table>
                <thead>
                <tr>
                    <th width="40%">쿠폰명</th>
                    <th width="15%">혜택</th>
                    <th width="25%">사용조건</th>
                    <th width="20%">사용기한</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="left name">[2020 캣츠 내한공연] 5천원 할인 쿠폰</td>
                    <td class="point">5천원 할인</td>
                    <td>[2020 캣츠 내한공연] 예매시</td>
                    <td>2020.08.29 23:59까지</td>
                </tr>
                <tr>
                    <td class="left name">[2020 캣츠 내한공연] 5천원 할인 쿠폰</td>
                    <td class="point">5천원 할인</td>
                    <td>[2020 캣츠 내한공연] 예매시</td>
                    <td>2020.08.29 23:59까지</td>
                </tr>
                <tr>
                    <td class="left name">[2020 캣츠 내한공연] 5천원 할인 쿠폰</td>
                    <td class="point">5천원 할인</td>
                    <td>[2020 캣츠 내한공연] 예매시</td>
                    <td>2020.08.29 23:59까지</td>
                </tr>
                <tr>
                    <td class="left name">[2020 캣츠 내한공연] 5천원 할인 쿠폰</td>
                    <td class="point">5천원 할인</td>
                    <td>[2020 캣츠 내한공연] 예매시</td>
                    <td>2020.08.29 23:59까지</td>
                </tr>
                <tr>
                    <td class="left name">[2020 캣츠 내한공연] 5천원 할인 쿠폰</td>
                    <td class="point">5천원 할인</td>
                    <td>[2020 캣츠 내한공연] 예매시</td>
                    <td>2020.08.29 23:59까지</td>
                </tr>
                </tbody>
            </table>

            <div class="pageBar">
                <a href="" class="pageBtn prevFist"></a>
                <a href="" class="pageBtn prev"></a>
                <em class="pageLink">1</em>
                <a href="" class="pageLink">2</a>
                <a href="" class="pageLink">3</a>
                <a href="" class="pageBtn next"></a>
                <a href="" class="pageBtn nextLast"></a>
            </div>
        </div>

        <div id="qnaDiv">
            <div class="tableTitle">나의 문의</div>

            <table>
                <thead>
                <tr>
                    <th width="20%">카테고리</th>
                    <th width="50%">제목</th>
                    <th width="10%">등록일</th>
                    <th width="20%">상태</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>공연문의</td>
                    <td class="left"><span onclick="modal()">캣츠 예매 관련하여 문의합니다.</span></td>
                    <td>2020.08.29</td>
                    <td class="point">답변완료</td>
                </tr>
                <tr>
                    <td>공연문의</td>
                    <td class="left"><span onclick="modal()">캣츠 예매 관련하여 문의합니다.</span></td>
                    <td>2020.08.29</td>
                    <td class="point">답변완료</td>
                </tr>
                <tr>
                    <td>공연문의</td>
                    <td class="left"><span onclick="modal()">캣츠 예매 관련하여 문의합니다.</span></td>
                    <td>2020.08.29</td>
                    <td class="point">답변완료</td>
                </tr>
                <tr>
                    <td>공연문의</td>
                    <td class="left"><span onclick="modal()">캣츠 예매 관련하여 문의합니다.</span></td>
                    <td>2020.08.29</td>
                    <td class="point">답변완료</td>
                </tr>
                <tr>
                    <td>공연문의</td>
                    <td class="left"><span onclick="modal()">캣츠 예매 관련하여 문의합니다.</span></td>
                    <td>2020.08.29</td>
                    <td class="point">답변완료</td>
                </tr>
                </tbody>
            </table>

            <div class="pageBar">
                <a href="" class="pageBtn prevFist"></a>
                <a href="" class="pageBtn prev"></a>
                <em class="pageLink">1</em>
                <a href="" class="pageLink">2</a>
                <a href="" class="pageLink">3</a>
                <a href="" class="pageBtn next"></a>
                <a href="" class="pageBtn nextLast"></a>
            </div>

            <div id="modalBack" style="display: none">
                <div id="modal">
                    <div class="modalTitle">
                        <div id="questionTitle">캣츠 예매 관련하여 문의합니다.</div>
                        <div id="closeBtn" onclick="closeModal()"></div>
                        <div class="modalDate">2020.08.15</div>
                    </div>
                    <div id="questionContent">공연 관람 당일 취소가 가능한가요?</div>
                    <div class="modalTitle answerDiv">
                        <div id="answerTitle"><img src="../img/TICKET24.png" alt="TICKET24" width="20px">&nbsp;TICKET24 고객센터</div>
                        <div class="modalDate">2020.08.16</div>
                    </div>
                    <div id="answerContent">기본적으로 공연 관람 당일 취소는 불가합니다.<br>
                        (관람일 당일 취소가 가능한 일부 공연의 경우 티켓 금액의 90%가 취소수수료로 부과됩니다.)<br>
                        공연의 특성에 따라 취소마감시간/취소수수료 정책이 달라질 수 있으니 예매 시 반드시 각 공연 상세페이지를 확인해주시기 바랍니다.</div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    function modal() {
        let modal = document.getElementById('modalBack');
        modal.style.display = 'block';
    }

    function closeModal() {
        let modal = document.getElementById('modalBack');
        modal.style.display = 'none';
    }

    window.onclick = function(event) {
        let modal = document.getElementById('modalBack');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</html>