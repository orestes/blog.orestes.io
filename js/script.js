(function() {
    var list = document.querySelectorAll('div.content>img');
    for(var i = 0; list.length; i++) {
            list[i].onclick = function() { window.open(this.src) };
    }
})();