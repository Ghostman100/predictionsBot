<script>
document.addEventListener("DOMContentLoaded", function(){
    var clickId = location.href.split("?clickid=")
    var link = "http://148.251.152.209/click.php?cnv_id=#s2#&payout=#price#"
	var s = link.replace("#s2#", clickId[1]).replace("#price#", 1);
    var i = new Image();
	i.src = s;
});
</script>