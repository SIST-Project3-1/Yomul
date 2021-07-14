<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요물 채팅</title>
<!-- HEAD -->
<%@ include file="../../head.jsp"%>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="../header.jsp"%>

	<!--  BODY  -->
	<section id="chat" class="mt-3">
		<div class="container" style="height: 85vh;">
			<div class="row border rounded p-2 h-100">
				<!--  채팅 대상 -->
				<div class="col-3 border-right overflow-auto h-100">
					<h3>채팅</h3>
					<button type="button" class="card btn text-left my-2 p-3 w-100 bg-dark text-white">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
					<button type="button" class="card btn text-left my-2 p-3 w-100">
						<div>
							<img class="rounded-circle" src="https://via.placeholder.com/50"> <span class="ml-2"><strong>Hwisaek</strong></span>
						</div>
					</button>
				</div>

				<!-- 채팅 내용 -->
				<div id="chat-panel" class="col-9 h-100">
					<div id="chat-content" class="overflow-auto" style="height: 75vh;">
						<div class="text-left my-3">
							<div class="chat-you">경찰청 철창살은 외철창살이고 검찰청 철창살은 쌍철창살이다.</div>
							<small class="text-muted">12:30</small>
						</div>
						<div class="text-left my-3">
							<div class="chat-you">고려고교 교복은 고급교복이고 고려고교 교복은 고급원단을 사용했다.</div>
							<small class="text-muted">13:44</small>
						</div>
						<div class="text-right my-3">
							<small class="text-muted">14:34</small>
							<div class="chat-me">뻗은가지 굽은가지 구부러진 가지 가지가지의 가지 올라가지 늦가지 찐가지 달린가지 조롱조롱 맺힌 가지 열린 가지 달린 가지 도롱도롱 달란 가지 젊은 가지 늙은 가지 나물할 가지 냉국 탈 가지 가지각색 가여놓아도 나 못 먹긴 마찬가지.</div>
						</div>
						<div class="text-left my-3">
							<div class="chat-you">산 사람들과 선 사람 둘과 선사시대 사람들 속에 속해있는 사람들 속에서 선사람 둘을 솎아낼까. 선 사람 둘과 산 사람들과 선사시대 사람들 속에 섞여있는 선 사람들 속에 안 선 사람을 더 섞을까. 선사시대 사람들과 산 사람들과 선 사람 둘이 전부 서서 서로가 서로를 서로 솎아내려 할 때 선사시대 사람은 선 사람이나 안 선 사람이나 선한 사람이나 안 선 상태로 서로 손을 잡고 3433년 3월 13일 신시와 3시 33분 33초를 서로의 눈을 보며 말하자고 했다.</div>
							<small class="text-muted">14:35</small>
						</div>
						<div class="text-right my-3">
							<small class="text-muted">14:34</small>
							<div class="chat-me">스위스에서 오셔서 산새들이 속삭이는 산림 숲속에서 수사슴을 샅샅이 수색해 식사하고 산 속 샘물로 세수하며 사는 삼십 삼살 샴쌍둥이 미세스 스미스씨와 미스터 심슨씨는 삼성 설립 사장의 회사 자산 상속자인 사촌의 사돈 김상속씨의 숫기있고 숭글숭글한 숫색시 삼성소속 식산업 종사자 김삼순씨를 만나서 삼성 수산물 운송수송 수색 실장에게 스위스에서 수사슴을 샅샅이 수색했던 것을 인정받아 스위스 수산물 운송 수송 과정에서 상해 삭힌 냄새가 나는 수산물을 수색해내는 삼성 소속 수산물 운송수송 수색 사원이 돼서 살신성인으로 쉴새없이 수색하다 산성수에 손이 산화되어 수술실에서 수술하게 됐는데 쉽사리 수술이 잘 안 돼서 심신에 좋은 산삼을 달여 슈르릅 들이켰더니 힘이 샘솟아 다시 몸사려 수색하다 삼성 소속 식산업 종사자 김삼순씨와 셋이서 삼삼오오 삼월 삼십 삼일 세시 삼십 삼분 삼십 삼초에 쉰 세살 김식사씨네 시내 스시식당에 식사하러 가서
								싱싱한 샥스핀 스시와 삼색샤시참치스시를 살사소스와 슥슥삭삭 샅샅이 비빈 것과 스위스산 소세지를 샤샤샥 싹쓸어 입속에 쑤셔넣어 살며시 삼키고 스산한 새벽 세시 삼십 삼분 삼십 삼초에 산림 숲속으로 사라졌다는 스위스에서온 스미스씨 이야기</div>
						</div>
						<div class="text-left my-3">
							<div class="chat-you">더 어려운 버전도 있다! 스위스에서 오셔서 산새들이 속삭이는 산림 숲속의 수사슴과 샘 속 송사리 새끼를 샅샅이 수색해 식사하고 산 속 고인돌 사이 샘물로 세수하며 살아가는 삼십 삼살 샴쌍둥이 미세스 스미스씨와 미스터 심슨씨는 삼성 설립 사장의 자상한 회사 자산 상속자인 사촌의 사돈이면서 수하물 수송 솜씨를 자랑하는 심삼속씨와 숫기있고 숭글숭글한 숫색시 삼성소속 식산업 종사자 심삼순씨를 만나서 삼성 소속 수산물 운송수송 수속 및 수색 담당 실장에게 스위스에서 수사슴을 수색했던 것을 인정받아 스위스산 수산물 운송 수송 과정에서 상해 삭힌 냄새가 나는 수산물을 샅샅이 수색해내는 삼성 수산물 운송수송 소속 수색 사원이 되자 산 속을 맨발바닥 두 손바닥 열 발가락 닳게 방방곡곡 뒤져 깊은 숲 산기슭 속 수풀 깊숙이 팔꿈치를 꿈틀꿈틀거려 찾아낸 스위스연방 지도 지리지를 들고 풀숲 샘물 속 수산물을 쉴새없이 수색하다 삼림 산성수 수색
								담당 신상순 씨가 실수로 수송한 삼림 산성수 통 삼 톤에 의해 손가락 세 가닥과 열 발가락이 산화되어 응급실 수술실에서 응급수술하게 되었는데 수술실 실수로 쉽사리 수술이 잘 안되어 수술실 식사로 나온 산양삼삼계탕을 삼키지 못하자 심신에 좋다는 산삼을 달인 달콤한 홍삼산삼차를 슈르릅 들이켰더니 힘이 샘물 솟듯이 솟아 신상순 씨의 삼림 산성수 수송 수속 중 일어난 수술 건을 과실치사상죄로 고소하였지만 산성수 수색 담당 신상순 씨의 삼촌인 삼성 소속 식산업 종사자 심삼순씨의 사과로 셋이서 삼삼오오 삼월 삼십일일 세 시 삼십분 삼십 삼초에 쉰 세 살 김식사씨네 시내 스시식당에 시스루 룩으로 식사하러 가서 신선한 샥스핀 스시와 싱싱한 삼색샤시참치스시를 살사소스에 살살 슥삭슥삭 비빈 것과 스위스산 소세지 세 접시를 샤사샥 싹슬어 입속에 쑤셔넣어 살며시 삼키고 스산한 새벽 세시 십삼분 삼십 삼초에 숲 속 산림 산기슭 구석 풀숲 속으로 사라졌다.</div>
							<small class="text-muted">14:35</small>
						</div>
						<script>
							$('#chat-content').scrollTop($('#chat-content')[0].scrollHeight);
						</script>
					</div>
					<div id="chat-input">
						<hr>
						<form action="#" method="post" class="w-100">
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="채팅을 입력해주세요..." aria-describedby="btn_submit" required>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="submit" id="btn_submit">전송</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="../footer.jsp"%>
</body>
</html>