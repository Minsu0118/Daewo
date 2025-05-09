# Daewo

# 20250509 html layout
layoout에 대한 소스 코드 확인
```html
<!DOCTYPE html> <!-- HTML5 문서임을 선언 -->
<html lang="en"> <!-- 문서 언어를 영어로 설정 -->
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩을 UTF-8로 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹 설정 -->
    <title>Document</title> <!-- 브라우저 탭에 표시될 제목 -->

    <style>
        /* 전체 html, body 높이를 100%로 설정 */
        html, body {
            height: 100%;
        }

        /* body 기본 마진 제거 */
        body {
            margin: 0;
        }

        /* 페이지 전체를 감싸는 컨테이너 */
        #container {
            margin: 0 auto; /* 가운데 정렬 */
            width: 100%; /* 전체 너비 */
            height: 100%; /* 전체 높이 */
            background-color: gainsboro; /* 배경색 회색빛 */
        }

        /* 상단 영역: header */
        header {
            height: 70px; /* 높이 설정 */
            background-color: greenyellow; /* 배경색 연두색 */
            line-height: 70px; /* 수직 가운데 정렬 */
        }

        /* 네비게이션 영역 */
        nav {
            height: 70px;
            background-color: orange; /* 배경색 주황 */
            line-height: 70px;
        }

        /* 본문 영역 */
        main {
            height: 600px;
            background-color: purple; /* 배경색 보라색 */
            line-height: 600px;
        }

        /* 하단 영역 */
        footer {
            height: 70px;
            background-color: orange;
            line-height: 70px;
        }

        /* 모든 주요 블록(header, nav, main, footer)을 가운데 정렬 */
        header, nav, main, footer {
            margin: 0 auto;
        }

        /*
        공통 스타일 클래스: header, nav, main, footer에서 사용할 디자인 요소를 정의
        */
        .common {
            width: 800px; /* 고정 너비 */
            color: white; /* 글자색 흰색 */
            font-size: 30px; /* 글자 크기 */
            text-align: center; /* 가운데 정렬 */
        }
    </style>
</head>
<body>
    <!-- 전체 컨텐츠를 감싸는 container -->
    <div id="container">
        <!-- 상단 영역 -->
        <header class="common">header</header>

        <!-- 내비게이션 영역 -->
        <nav class="common">nav</nav>

        <!-- 본문 영역 -->
        <main class="common">main</main>

        <!-- 하단 영역 -->
        <footer class="common">footer</footer>
    </div>
</body>
</html>

```
