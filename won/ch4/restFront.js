function getUser() {
	var xhr = new XMLHttpRequest();
	xhr.onload = function() {
		if (xhr.status === 200) {
			var users = JSON.parse(xhr.responseText);
			var list = document.getElementById('list');
			list.innerHTML = '';
			Object.keys(users).map(function(key) {
				var userDiv = document.createElement('div');
				var span = document.createElement('span');
				sapn.textContent = users[key];
				var edit = document.createElement('button');
				edit.textContent = '수정';
				edit.addEventListener('click', function() {
					var name = prompt('바꿀 이름을 입력');
					if (!name) {
						return alert('이름을 반드시 입력');
					}
					var xhr = new XMLHttpRequest();
					xhr.onload = function() {
						if (xhr === 200) {
							console.log(xhr.responseText);
							getUser();
						} else {
							console.error(xhr.responseText);
						}
					};
					xhr.open('PUT', '/users/' + key);
					xhr.setRequestHeader('Content-Type', 'application/json');
					xhr.send(JSON.stringify({
						name : name
					}));
				});
				var remove = document.createElement('button');
				remove.textContent = '삭제';
				remove.addEventListener('click', function() {
					var xhr = new XMLHttpRequest();
					xhr.onload = function() {
						if (xhr.status === 200) {
							console.log(xhr.responseText);
							getUser();
						} else {
							console.log(xhr.responseText);
						}
					};
					xhr.open('DELETE', '/userrs/', key);
					xhr.send();
				});
				userDiv.appendChild(span);
				userDiv.appendChild(edit);
				userDiv.appendChild(remove);
				list.appendChild(userDiv);
			});
		} else {
			console.log(xhr.responseText);
		}
	};
	xhr.open('GET', '/users/');
	xhr.send();
}