function allowDrop(ev) {
	if(!ev){
		ev = window.event;
	}
	//console.log('allowDrop');
	ev.preventDefault();
}

function drag(ev) {
	if(!ev){
		ev = window.event;
	}

	console.log('ondragstart');
	//ev.dataTransfer.setData("Text",ev.target.id);
	dragId = ev.target.id;
	//dragTrash(ev);
}

/*
function dragTrash(ev) {
	if(!ev){
		ev = window.event;
	}

	if (document.getElementById('trash') == null) {
		var img = document.createElement('img');
		img.setAttribute('src', 'CITS4230.2/assets/trash.png');
		img.setAttribute('id', 'trash');
		img.setAttribute('width', '50');
		img.setAttribute('style', 'position: relative; left:-5px');
		img.ondragover = allowDrop;
		img.ondrop = dropTrash;

		console.log(ev.target);
		var titlenode = ev.target;
		while (titlenode.getAttribute('class') != 'imgblock') titlenode = titlenode.parentNode;

		titlenode.appendChild(img);

		setTimeout(dragEnd, 3000);
	}

}

function dropTrash(ev) {
	if(!ev){
		ev = window.event;
	}
	//ev.preventDefault();
	var data = ev.dataTransfer.getData("text/html");
	data = data.match(/id=\"img\d+/)[0].split('"')[1];
	var node = document.getElementById(data).parentNode.parentNode;
	node.parentNode.removeChild(node);
}
*/
function dragEnd(ev) {
	if(!ev){
		ev = window.event;
	}

	var x = document.getElementById('trash');
	if (x != null) {
		x.parentNode.removeChild(x);
	}
}

function drop(ev) {
	if(!ev){
		ev = window.event;
	}
	ev.preventDefault();
	console.log('drop');
	dragEnd();
	if (ev.target != ev.source && ev.target.id != 'trash') {
		var data = ev.dataTransfer.getData("text/html");
		data = data.match(/id=\"img\d+/)[0].split('"')[1];
		var node = document.getElementById(data).parentNode;
		var titlenode = ev.target; //ev.toElement || ev.originalTarget || ev.currentTarget;
		console.log(titlenode);
		while (titlenode.getAttribute('class') != 'imgblock') titlenode = titlenode.parentNode;
		titlenode = titlenode.firstElementChild;
		var title = titlenode.innerHTML.split(/\<span\>/)[0];
		node.setAttribute('class', 'lightbox[' + title + ']');
		titlenode.nextElementSibling.appendChild(node.parentNode);
	}
}

function expandOrCollapse(ev) {
	if(!ev){
		ev = window.event;
	}
	console.log(ev);
	var x = ev.target; //ev.toElement || ev.originalTarget || ev.currentTarget; //Chrome Firefox Opera compatibility
	var list = x.parentNode.nextElementSibling;
	list.style.display = list.style.display == 'none' ? 'block' : 'none';
	x.innerHTML = x.innerHTML == ' -' ? ' +' : ' -';

}

function createImageBlock(ev) {
	if(!ev){
		ev = window.event;
	}

	var newName = prompt('Enter new Group Name:', 'new group');
	if (!newName) return;
	var imgblock = document.createElement('div');
	imgblock.setAttribute('class', 'imgblock');
	imgblock.setAttribute('ondrop', 'drop(event)');
	imgblock.setAttribute('ondragover', 'allowDrop(event)');
	imgblock.setAttribute('id', newName + 'block');

	var h2 = document.createElement('h2');
	h2.innerHTML = newName + '<span> -</span>';
	var span = h2.getElementsByTagName('span')[0];
	span.onclick = expandOrCollapse;

	var imglist = document.createElement('ul');
	imglist.setAttribute('class', 'imglist');


	imgblock.appendChild(h2);
	imgblock.appendChild(imglist);
	imgblock.appendChild(document.createElement('hr'));
	document.getElementById('imgwrap').appendChild(imgblock);
}

function handleDragStart(ev) {
	if(!ev){
		ev = window.event;
	}
	console.log('dragstart');
}

function initImgs() {
	imgblocks = document.getElementsByClassName('imgblock');
	var i = 0;
	while (imgblocks[i]) {
		imgblocks[i].ondrop = drop;
		imgblocks[i].ondragover = allowDrop;
		var h2 = imgblocks[i].getElementsByTagName('span')[0];
		h2.onclick = expandOrCollapse;
		var j = 0;
		var imgs = imgblocks[i].getElementsByTagName('img');
		while (imgs[j]) {
			imgs[j].ondragstart = drag;
			imgs[j].ondragend = dragEnd;
			imgs[j].ondragdrop = function() {
				console.log('ondragdrop');
			};
			//imgs[j].ondragover = allowDrop;
			//imgs[j].ondrag=function(){console.log('dragging...');};
			imgs[j].onmousedown = dragTrash;
			imgs[j].onmouseup = dragEnd;
			j++;
		}
		console.log(i);
		i++;


	}


}
trash = 0;
dragID = '';
window.onload = initImgs;