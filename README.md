# BoardProject
## 프로젝트 소개 :page_with_curl:
> 로그인을 통해 게시글을 확인하거나 게시글을 , 수정,삭제 및 댓글작성 등 CRUD기능을 통해서 기본적인 커뮤니케이션을 할 수 있는 게시판을 만들었습니다.
> spring을 이용해서 MVC모델을 구현했고, Model과 Controller단은 JAVA, VIEW단은 jsp, HTML과 CSS 그리고 JavaScript를 사용했습니다. 
> JavaScript 라이브러리인 jQuery와 ajax를 통해서 서버와 비동기 통신을 했고, 전체적인 UI는 부트스트랩을 이용해 깔끔한 디자인으로 구성했습니다. 
---
## 개발환경 및 개발도구 :hammer:
 - Eclipse(2020-06)
 - STS 4.3.9
 - JDK1.8
 - Maven 2.9
 - Mybatis 3.4
 - MySQL 8.0.11
 - jQuery 3.5.1
 - Bootstrap 3.3.2
 ---
 ## 프로젝트 Use Case Diagram
 ![UseCaseDiagram](https://i.esdrop.com/d/aHdVl8BMzz.png)
-----------------------------

## Section :checkered_flag:
1. 게시판
- [게시글 목록보기](#게시글-목록보기)
- [게시글 상세보기](#게시글-상세보기)
- [게시글 등록](#게시글-등록)
- [게시글 수정](#게시글-수정)
- [게시글 삭제](#게시글-삭제)
2. 회원
- [회원가입](#회원가입)
- [로그인](#로그인)
- [회원수정](#회원수정)
- [회원삭제](#회원삭제)
3. 댓글
- [댓글보기](#댓글보기)
- [댓글등록](#댓글등록)
- [댓글수정](#댓글수정)
- [댓글삭제](#댓글삭제)

## 상세기능
---
### 게시글 목록보기
: 데이터베이스에 있는 모든 게시글들을 select하여 화면에 출력하며, 제목컬럼에서 값을 누르면 해당 게시글 번호로 게시글 상세보기를 할 수 있습니다.

_추가 기능 구현_ 
- 페이징 처리
- 검색 기능(제목, 내용, 작성자)

[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/getBoardList.jsp)

---

### 게시글 상세보기
: 게시글 목록에서 게시글 제목을 클릭시 리다이렉트되며, 게시글 제목, 작성자, 내용, 등록일자, 조회수를 볼 수 있습니다.
 게시글 등록, 수정, 삭제, 목록 버튼이 있으며 게시글 목록을 제외한 버튼은 LoginInterceptor에 의해 반드시 로그인을 했을 떄만 사용할 수 있습니다.
 댓글관련 기능을 사용할 수 있습니다.
 
_추가 기능 구현_
 - 새로고침을 통한 조회수 증가방지(Cookie사용)
 - LoginInterceptor
 
 [코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/getBoard.jsp)
 
 ---
 
 ### 게시글 등록
 : 로그인시 사용가능한 기능이며, 데이터베이스에 게시글을 insert합니다.
 
 [코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/insertBoard.jsp)
 
 ---
 
 ### 게시글 수정
 : 로그인시 사용가능한 기능이며, 데이터베이스에 있는 게시글을 update합니다. 게시글 번호에 있는 값을 받아서 화면에 출력합니다.
 
 [코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/updateBoard.jsp)
 
 ---
 
 ### 게시글 삭제
 : 로그인시 사용가능한 기능이며, 데이터베이스에 있는 게시글을 delete합니다.

---

### 회원가입
: 회원정보를 데이터베이스에 insert합니다. 아이디, 비밀번호, 재확인, 이름, 이메일, 전화번호, 생년월일, 성별 필드가 있으며, 모든 필드는 정규식을 통해서 각 유효성검사를 실시하게 되고, 빈 값을 입력하는 것을 방지하기위해 자바스크립트를 사용하여 form값이 컨트롤러로 넘어가기 전에, 값이 비어있는지 체크한 후 비어있으면 값을 넘기지 못하도록 합니다.

아이디같은 경우, 중복검사버튼을 만들어 작성한 아이디가 데이터베이스에 있는지 확인하기 위해 ajax를 통한 비동기 통신을 사용합니다. 
비밀번호와 재확인의 경우 입력한 값이 다르면 alert()창을 띄워서 알립니다.

이이디와 비밀번호 재확인은 실시간으로 유효성검사를 진행하며 해당 입력폼밑에 검사결과를 알려줍니다. 

ex)아이디의 실시간 입력값 검사 JavaScript(jquery)
```JavaScript
	 $("#userId").on("propertychange change keyup paste input", function(){
  		...
	 });
```
이메일 인증 구현 기능은 gmail smtp 서버를 통해서 이메일을 전송할 수 있도록 했습니다.
해당 이메일 인증 코드를 전송받으면 맞춰진 3분 타이머내에 값을 입력할 수 있도록 하였고, 입력시간 초과 시 
인증코드를 입력할 수 없도록 했습니다.
ex)이메일 전송 코드
```JAVA
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
...
MimeMessage mail = mailSender.createMimeMessage();
MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");

mailHelper.setFrom(from);
mailHelper.setTo(to);
mailHelper.setSubject(subject);
mailHelper.setText(content);

mailSender.send(mail);
	 });
```

ex)이메일 인증코드 난수 생성
```JAVA
import org.apache.commons.lang3.RandomStringUtils;
...
RandomStringUtils random = new RandomStringUtils();
authcode = random.randomAlphanumeric(6).toUpperCase(); // 난수생성 대문자 + 숫자
```

_추가 기능 구현_
- 중복검사 버튼
- 이메일 인증 구현

[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/insertUser.jsp)

---

### 로그인
: 사용자가 아이디와 비밀번호를 입력하면, 데이터베이스에서 입력한 아이디와 일치하는 데이터가 있는지 확인하고, 해당 아이디에 비밀번호가 일치하면 데이터베이스에서 데이터를 select합니다.
서버에서 Map<String,Boolean> 객체를 만들어 사용자가 로그인에 실패할 경우 해당 객체를 이용해 아이디와 비밀번호 중 잘못된 부분을 알려줍니다.

[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/login.jsp)

---

### 회원수정
: 로그인 시 회원관리에서 회원수정버튼을 누르면 해당 페이지로 이동하고 세션에 있는 모델값을 이용해 사용자의 정보를 화면에 보여줍니다.
사용자 정보를 데이터베이스에서 update합니다. 비밀번호의 경우 비밀번호 변경하기 버튼을 누르면 수정을 할 수있습니다. 이 경우 비밀번호는 이전 비밀번호를 
사용할 수 없도록 하였습니다.

[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/updateUser.jsp)

---

### 회원삭제
: 로그인 시 회원관리에서 회원삭제를 누르면 해당 아이디와 정보가 데이터베이스에서 delete됩니다. 이때 남아있는 세션정보를 제거하기 위해 spring에서 제공하는 SessionStatus를 사용합니다.

```JAVA
sessionStatus.setComplete(); 
```

---

### 댓글보기
: 게시글 상세보기 하단에서 볼 수 있으며, ajax를 통한 비동기 통신방식을 사용하여 댓글의 변화를 실시간으로 확인할 수 있습니다.
데이터베이스에서 해당 게시글의 모든 댓글을 select하고, 로그인 시 본인이 쓴 댓글은 수정 및 삭제 버튼을 추가해 수정, 삭제를 바로 할 수 있도록 하였습니다.

[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/getBoard.jsp)

---

### 댓글등록
: 게시글 상세보기에서 볼 수 있으며, 로그인 시 댓글 작성폼이 나타납니다. ajax를 통한 비동기 통신방식을 사용하여 댓글을 실시간으로 등록할 수 있고,
데이터베이스에서 해당 게시글의 댓글을 insert합니다. 댓글폼이 비어있을 경우, 댓글 등록을 할 수 없도록 하였습니다.

[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/getBoard.jsp)

---

### 댓글수정
: 게시글 상세보기에서 볼 수 있으며, 로그인 시 댓글 목록에서 본인이 쓴 댓글만 수정할 수 있도록 하였습니다. ajax를 통한 비동기 통신방식을 사용하여 댓글을 실시간으로 
수정할 수 있고, 데이터베이스에서 해당 게시글의 댓글을 수정합니다.


[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/getBoard.jsp)

---

### 댓글삭제
: 게시글 상세보기에서 볼 수 있으며, 로그인 시 댓글 목록에서 본인이 쓴 댓글만 삭제할 수 있도록 하였습니다. ajax를 통한 비동기 통신방식을 사용하여 댓글을 실시간으로 
삭제할 수 있고, 데이터베이스에서 해당 게시글의 댓글을 삭제합니다.


[코드보기](https://github.com/Choisungbum/BoardProject/blob/main/ProjectBoard/src/main/webapp/WEB-INF/views/getBoard.jsp)
