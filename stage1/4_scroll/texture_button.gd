extends TextureButton

var clickCount:int 

var text_blocks:Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clickCount = 0
	
	text_blocks = [
		"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lobortis congue tortor id suscipit. Etiam ac rutrum nisi, a congue lacus. In urna eros, imperdiet at ipsum eget, sagittis consectetur augue. Vestibulum quis lacinia lorem. Duis fringilla justo at mauris laoreet rutrum. Pellentesque est libero, vulputate at auctor condimentum, volutpat a purus. Vestibulum quis volutpat mauris. Donec lacus massa, interdum vitae posuere ac, ullamcorper congue sapien. Vestibulum vulputate est sed pellentesque auctor. Duis congue libero quam, in auctor elit tincidunt in. Ut viverra risus eget dictum eleifend. In hac habitasse platea dictumst.

Proin vel justo lacus. Phasellus ac aliquet nisl, sed hendrerit libero. Curabitur imperdiet tortor feugiat tincidunt tincidunt. Nunc sed mi non tortor tristique dapibus. Mauris ornare sollicitudin nunc, sed ultrices nulla pellentesque ut. Suspendisse commodo quis orci et condimentum. Donec vitae interdum dolor.

Mauris in erat venenatis, aliquet sem ac, euismod magna. Duis turpis tortor, pellentesque eu leo et, hendrerit hendrerit est. Etiam ut dolor sit amet tellus sagittis accumsan. Praesent volutpat ipsum ut nisi dictum consequat. Vestibulum et libero consequat, volutpat neque id, pharetra sapien. Etiam quis gravida justo, sed varius dui. Fusce elit quam, aliquet ut iaculis nec, suscipit et neque. Suspendisse potenti. Phasellus vitae consectetur mi. Phasellus vel orci at mi laoreet sollicitudin ac sit amet quam. Sed condimentum consequat lorem. Cras vestibulum sagittis magna sit amet iaculis. Morbi quam ipsum, tristique ac mollis sit amet, accumsan ac tortor.

Integer mi est, sollicitudin vitae congue id, elementum eget risus. Aenean nec ante dolor. Sed commodo lorem eget consequat porta. Suspendisse posuere porta arcu vel finibus. Integer commodo mauris condimentum sem interdum elementum. Proin semper risus mi, ac dignissim justo sollicitudin ut. Interdum et malesuada fames ac ante ipsum primis in faucibus.

Fusce fermentum, libero non tincidunt blandit, elit orci maximus nulla, ut feugiat est lorem et magna. Aliquam purus neque, blandit sed pulvinar et, facilisis nec mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer auctor arcu sed efficitur auctor. Praesent varius odio quis tristique malesuada. Mauris luctus nunc vitae congue vulputate. Cras aliquam massa volutpat mattis viverra. Pellentesque vel nunc quis tortor vehicula iaculis. Praesent id tempus leo. Cras varius ornare faucibus. Vivamus non purus nec tortor pharetra fringilla suscipit at diam.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Sed quis nunc et orci ullamcorper semper.

Integer sed mauris aliquet, pretium dui at, fringilla orci.
Donec semper nunc in sapien vestibulum, vitae malesuada risus posuere.

Ut elementum dolor non est finibus, quis blandit ligula egestas.
Nullam id risus eu sapien egestas ornare.
Sed euismod leo non libero maximus, ornare consequat leo tincidunt.
Vestibulum fringilla dui non purus ornare, id tempus est commodo.
Proin et quam suscipit, pellentesque lorem a, aliquam magna.
Duis mollis nisi id pharetra eleifend.

Vestibulum sollicitudin risus sed dui tincidunt, vitae tempor ligula faucibus.
Donec a velit id turpis gravida suscipit.
Aenean at lacus sagittis tellus iaculis posuere.
Vivamus at mauris in magna ornare tristique vel in sapien.
Integer ultricies neque at urna rhoncus tempus.

Nam vulputate risus eu felis gravida, quis vehicula turpis consequat.
In ac quam sagittis, suscipit dolor id, pellentesque ex.
Suspendisse porta ipsum ut varius eleifend.
Aenean vitae diam ut dolor molestie porttitor nec eu risus.
Vestibulum eu lorem at urna commodo imperdiet.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac euismod sem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean et erat sapien. In rutrum et sem at porttitor. Nunc eu pharetra massa. Sed lobortis accumsan sapien. Vestibulum porttitor justo lacus. Quisque nunc sem, consectetur eu blandit eu, feugiat ut ex.

Proin mattis porta elit vitae iaculis. Aliquam semper feugiat purus, nec venenatis metus porta in. Nam sit amet sagittis diam, sit amet elementum odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed eget efficitur leo. Duis interdum urna sapien, non lacinia mauris tempor eu. Vivamus mattis massa tortor, sed posuere purus auctor eu. Aliquam erat volutpat. Quisque quis imperdiet arcu, et porta tortor. Mauris a justo venenatis, ultricies sem in, fringilla magna. Mauris lacus ipsum, convallis et sapien pulvinar, mattis lobortis nisi. Vestibulum rhoncus arcu eu tellus tincidunt mattis. Donec auctor imperdiet erat id mattis. Quisque ultricies pellentesque facilisis.

Vivamus nibh turpis, egestas ut ullamcorper vel, ornare vel nisl. Mauris vel eros augue. Integer facilisis risus nulla, et consequat ex dignissim non. Donec nisl purus, condimentum quis eros et, scelerisque ullamcorper tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut ac mi ut enim lobortis lacinia ac et diam. Duis volutpat elit vitae ante varius, eget mollis dolor imperdiet.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dapibus interdum viverra. Quisque aliquam dictum dignissim. Donec sodales ac urna quis tristique. Aenean sit amet urna id mi luctus interdum. Praesent vitae mi aliquet, sollicitudin purus commodo, dictum erat. Fusce gravida dui id dolor vestibulum auctor. Sed at fringilla nisl. Proin dui quam, mattis molestie molestie et, auctor eget erat. Phasellus ut ligula orci. Integer eu nunc orci. Nam vel pulvinar enim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque molestie at elit non auctor. Donec eget euismod ante.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ac vestibulum metus. Cras rutrum euismod lorem, nec feugiat ante ullamcorper eget. Nunc pharetra justo nec justo suscipit, sed eleifend quam scelerisque. Suspendisse consectetur diam sed sapien pulvinar, at tempus eros gravida. Maecenas ultrices, leo ac sagittis faucibus, quam nulla bibendum erat, porttitor tincidunt lectus urna sit amet mi. Nunc luctus, nisi tincidunt aliquet mattis, ligula dolor elementum felis, sit amet gravida magna mauris consequat purus. Phasellus fringilla fermentum felis cursus congue. In non porttitor turpis. Morbi molestie, ante vitae porta vulputate, est massa ultricies ligula, sed feugiat nisi lectus eu ipsum. In eget commodo leo.

Quisque leo diam, varius non porta quis, hendrerit id est. Proin lacus ex, mollis non neque eget, tempus pulvinar sem. Sed in viverra dui, eu vulputate tellus. Aliquam erat volutpat. Vestibulum sed lobortis elit, ut sodales erat. Donec lobortis, purus sed eleifend rutrum, tellus leo egestas turpis, vitae ultricies urna nulla ac ipsum. Quisque nec luctus dolor. Proin eget dolor dolor. Aenean at malesuada nunc. Aliquam ultrices sollicitudin risus, eu varius nulla molestie sit amet. Vestibulum tempor gravida metus a blandit. Ut sit amet placerat dui, ut laoreet mauris. Praesent et mattis neque.

Suspendisse porta ante augue, et efficitur ligula suscipit vitae. Integer semper viverra sapien vel interdum. Vestibulum eu lacinia eros, at pretium odio. Sed ultricies massa id neque semper elementum. Morbi sollicitudin commodo enim, accumsan tincidunt ex dapibus ac. Duis sed ex vitae purus fringilla egestas id eget massa. Integer at nulla erat. Duis elementum lectus at volutpat vehicula. Curabitur sem tortor, rutrum in elit sed, fermentum viverra enim. Fusce at odio mollis, dignissim ex a, lacinia nulla. Phasellus vulputate et turpis non commodo. Cras vestibulum convallis massa id malesuada. Donec scelerisque nibh quis nisl posuere mattis. Aenean sed ultrices orci, at lobortis justo. Nulla ornare, mi eget tincidunt fringilla, arcu ligula commodo sapien, sit amet sollicitudin turpis tellus ut est. Mauris eu vulputate lectus.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dapibus interdum viverra. Quisque aliquam dictum dignissim. Donec sodales ac urna quis tristique. Aenean sit amet urna id mi luctus interdum. Praesent vitae mi aliquet, sollicitudin purus commodo, dictum erat. Fusce gravida dui id dolor vestibulum auctor. Sed at fringilla nisl. Proin dui quam, mattis molestie molestie et, auctor eget erat. Phasellus ut ligula orci. Integer eu nunc orci. Nam vel pulvinar enim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque molestie at elit non auctor. Donec eget euismod ante.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ac vestibulum metus. Cras rutrum euismod lorem, nec feugiat ante ullamcorper eget. Nunc pharetra justo nec justo suscipit, sed eleifend quam scelerisque. Suspendisse consectetur diam sed sapien pulvinar, at tempus eros gravida. Maecenas ultrices, leo ac sagittis faucibus, quam nulla bibendum erat, porttitor tincidunt lectus urna sit amet mi. Nunc luctus, nisi tincidunt aliquet mattis, ligula dolor elementum felis, sit amet gravida magna mauris consequat purus. Phasellus fringilla fermentum felis cursus congue. In non porttitor turpis. Morbi molestie, ante vitae porta vulputate, est massa ultricies ligula, sed feugiat nisi lectus eu ipsum. In eget commodo leo.

Quisque leo diam, varius non porta quis, hendrerit id est. Proin lacus ex, mollis non neque eget, tempus pulvinar sem. Sed in viverra dui, eu vulputate tellus. Aliquam erat volutpat. Vestibulum sed lobortis elit, ut sodales erat. Donec lobortis, purus sed eleifend rutrum, tellus leo egestas turpis, vitae ultricies urna nulla ac ipsum. Quisque nec luctus dolor. Proin eget dolor dolor. Aenean at malesuada nunc. Aliquam ultrices sollicitudin risus, eu varius nulla molestie sit amet. Vestibulum tempor gravida metus a blandit. Ut sit amet placerat dui, ut laoreet mauris. Praesent et mattis neque.

Suspendisse porta ante augue, et efficitur ligula suscipit vitae. Integer semper viverra sapien vel interdum. Vestibulum eu lacinia eros, at pretium odio. Sed ultricies massa id neque semper elementum. Morbi sollicitudin commodo enim, accumsan tincidunt ex dapibus ac. Duis sed ex vitae purus fringilla egestas id eget massa. Integer at nulla erat. Duis elementum lectus at volutpat vehicula. Curabitur sem tortor, rutrum in elit sed, fermentum viverra enim. Fusce at odio mollis, dignissim ex a, lacinia nulla. Phasellus vulputate et turpis non commodo. Cras vestibulum convallis massa id malesuada. Donec scelerisque nibh quis nisl posuere mattis. Aenean sed ultrices orci, at lobortis justo. Nulla ornare, mi eget tincidunt fringilla, arcu ligula commodo sapien, sit amet sollicitudin turpis tellus ut est. Mauris eu vulputate lectus.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sem leo, consectetur eu mi a, dictum convallis ipsum. Vivamus sed nunc quis ex pharetra dapibus. Fusce ante lectus, lobortis sit amet interdum fringilla, egestas ac metus. Vestibulum bibendum maximus diam, luctus congue risus. Suspendisse vitae ipsum auctor, imperdiet diam sed, rutrum justo. Aliquam ornare id dolor ut venenatis. Sed porta, sem vel interdum rhoncus, diam leo hendrerit ex, a tempus neque libero vitae odio. Quisque eu venenatis ante. Nulla sem nisi, bibendum vitae facilisis quis, laoreet quis dolor. Pellentesque id vestibulum neque, id consectetur ligula. Morbi lacus turpis, posuere a nibh lacinia, eleifend faucibus dolor. Aenean faucibus felis a leo posuere hendrerit. Phasellus eget laoreet ligula. Nam vulputate ante venenatis enim tempus maximus. Quisque dictum justo elit, eu condimentum augue semper sit amet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.

Aenean feugiat imperdiet congue. Donec placerat urna in sem convallis, eget placerat ante tempus. Duis iaculis sit amet ligula vel vulputate. Aenean condimentum nisi facilisis aliquet accumsan. Etiam sit amet facilisis dolor. Nulla lobortis diam aliquam libero pharetra dignissim. Praesent luctus ut elit in varius. Sed ante libero, elementum quis nisl quis, vulputate dapibus justo.

Vivamus ornare mollis magna, eu maximus magna tempus quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dui turpis, imperdiet eget metus sit amet, volutpat tempus leo. Morbi gravida sem et suscipit feugiat. Phasellus finibus justo et arcu aliquam, et efficitur orci aliquam. Cras interdum sit amet nisi nec congue. Cras blandit, mi a ullamcorper laoreet, justo lacus dictum mauris, eu lacinia velit nisi id augue. Pellentesque sed tincidunt quam, id placerat odio. Fusce turpis enim, venenatis sit amet neque sit amet, varius molestie tortor. Duis tincidunt consectetur neque id consectetur. Nunc id leo sodales, cursus mauris sit amet, egestas leo. Morbi semper lorem id finibus pulvinar. Nulla et ipsum maximus, mattis magna et, mollis nibh. Ut lacinia felis elit, ac auctor magna consectetur sit amet. Sed non placerat nulla. Nulla pulvinar lectus ut ante vehicula hendrerit.

Mauris euismod luctus libero in hendrerit. Suspendisse efficitur ex libero, id cursus turpis congue et. Vestibulum commodo hendrerit enim, sed vulputate arcu. Morbi iaculis sem nec scelerisque tincidunt. Sed id felis sed elit varius hendrerit sed nec mi. Sed arcu dui, volutpat eu nulla ac, venenatis ullamcorper lectus. Phasellus eget turpis a tellus dictum euismod at quis nulla. Sed congue nisl sit amet purus placerat pellentesque eget non arcu. Cras sit amet eros ut urna euismod aliquet non vitae sapien. Suspendisse ut dui augue. Interdum et malesuada fames ac ante ipsum primis in faucibus.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt, urna eu elementum placerat, ipsum nisl malesuada tellus, a ultricies ante nunc ac ipsum. Etiam tempus dolor nec erat egestas laoreet. Quisque semper velit a commodo lacinia. Praesent ut ante quis mauris euismod euismod ac nec turpis. Sed nec efficitur nisl, ac cursus diam. In hac habitasse platea dictumst. Quisque eu mi in urna maximus congue vel nec erat.

In blandit purus ut ex lobortis venenatis. Sed ullamcorper eros non leo dapibus rutrum. Proin auctor lacinia suscipit. Vivamus placerat tincidunt consectetur. Vestibulum justo eros, faucibus at lobortis non, cursus vitae purus. Vivamus enim ligula, vulputate eget finibus sit amet, bibendum iaculis massa. Donec vitae imperdiet ante. Donec tincidunt feugiat diam, sit amet condimentum nisl porttitor et. Fusce tincidunt, ex quis tincidunt dictum, nunc purus mattis felis, ut varius magna mi nec neque. Suspendisse in diam neque.

Duis erat dolor, eleifend a sagittis ac, pharetra pulvinar quam. Suspendisse a mauris vehicula, mattis nulla lacinia, posuere tortor. Duis posuere elit metus, eget iaculis risus efficitur eget. Quisque accumsan magna lectus, et interdum neque elementum at. Aenean tempus condimentum enim id sollicitudin. Maecenas at nisi in tellus tincidunt rutrum. Donec vulputate nisi sit amet elementum interdum. Vivamus rutrum elit egestas quam tincidunt, nec scelerisque neque posuere. Nunc vel fringilla leo, vel mattis nisl. Donec elit metus, convallis tempor libero sed, lobortis malesuada mauris. Praesent maximus nisl felis. Proin interdum nibh nec condimentum facilisis. Nunc blandit metus sit amet suscipit placerat. Suspendisse vel luctus felis, in scelerisque nisi.

Aliquam sit amet odio consequat, interdum nibh tempus, dictum leo. Sed sed libero non magna iaculis eleifend. Phasellus lectus eros, varius ut fermentum ut, laoreet quis arcu. Aenean eget volutpat mauris, et faucibus arcu. Etiam tincidunt, risus nec fermentum tristique, nulla dolor posuere lorem, at bibendum augue diam eget orci. Ut feugiat tortor ipsum, pharetra dapibus turpis commodo in. Aliquam accumsan egestas malesuada. Sed lacinia consectetur sem ac iaculis. In sapien arcu, ultrices et pulvinar et, molestie vel dui.

Sed vel fringilla lectus. Phasellus faucibus id ante ut ultricies. Nullam eros orci, iaculis a orci volutpat, scelerisque ultrices mauris. Aliquam erat volutpat. Integer eget erat vel ligula tincidunt vulputate quis id quam. Proin a mattis neque. Nullam sollicitudin purus vel ligula venenatis consectetur ac sit amet ex. In a odio urna.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Aliquam quis felis aliquet, sodales urna non, eleifend sem.
Fusce tincidunt erat vestibulum, efficitur sem nec, congue quam.
Aliquam id lacus eget lacus malesuada lacinia quis vel neque.
Quisque commodo nulla vitae nulla mollis, id ultricies risus viverra.

Aliquam viverra massa vel feugiat aliquam.
Morbi pharetra massa at odio pharetra, at condimentum mi convallis.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dictum nulla a bibendum commodo. Aliquam cursus tincidunt magna, et laoreet elit faucibus sit amet. Suspendisse venenatis posuere ex. Quisque interdum egestas ante, et auctor odio aliquet vel. Duis rutrum est a sagittis volutpat. Ut nec purus urna. Curabitur sed ultrices ipsum. Ut eget semper elit, ut feugiat lacus. Mauris tortor magna, ultricies non faucibus a, sollicitudin et tellus. Phasellus tincidunt tincidunt eros, in pharetra nisi semper vel. Donec convallis mattis lectus, id suscipit arcu laoreet id. Nullam ipsum mi, viverra eget leo quis, molestie gravida justo. Praesent at condimentum arcu. Duis non turpis quis massa facilisis congue in a mauris. Donec pellentesque urna suscipit, laoreet urna at, ullamcorper ex.

Nam scelerisque ex sit amet tristique dapibus. Maecenas orci sapien, vulputate ac urna posuere, pulvinar auctor est. Maecenas feugiat viverra massa, sed efficitur massa fermentum sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sed consectetur ipsum. Sed a magna bibendum, posuere lectus et, sagittis lorem. Donec aliquam dolor quis congue efficitur. Nunc mattis diam vitae leo sagittis pellentesque. Etiam ac elit aliquet, ullamcorper massa nec, semper lectus. Praesent consectetur, lorem vitae malesuada commodo, justo ipsum placerat nunc, nec dapibus felis elit in nunc. Etiam placerat laoreet ligula, a porta neque feugiat vitae.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Morbi id lectus euismod, varius eros sit amet, dignissim sem.
Etiam ut leo non mauris iaculis tristique in eu velit.
Aliquam sagittis tortor ac quam pretium, vulputate rhoncus sem sagittis.
Sed dictum enim ac euismod varius.

Curabitur pharetra nulla at pellentesque varius.
Duis ut ante consectetur urna euismod venenatis.
Nulla accumsan enim porttitor, suscipit velit non, facilisis nisl.

Suspendisse ullamcorper sapien et arcu consequat tristique.
Vivamus tempor velit eu quam interdum, vitae sodales diam auctor.
Nunc nec turpis sit amet massa imperdiet mollis a eu erat.
Etiam ornare lectus eu libero blandit, eu rhoncus mi feugiat.

Quisque feugiat elit cursus molestie commodo.
https://www.youtube.com/watch?v=NHozn0YXAeE&list=RDNHozn0YXAeE&start_radio=1.",

"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer venenatis orci a metus bibendum bibendum. Donec cursus in risus nec rhoncus. Phasellus eget nisi ullamcorper, egestas mauris ut, fringilla augue. Aliquam et enim non nunc pretium malesuada at sit amet orci. Phasellus nec fermentum tortor, eu vulputate eros. Etiam vulputate dignissim metus non elementum. Nullam placerat ligula risus, vel auctor eros blandit sed. Ut nec scelerisque neque. Sed eu neque in elit feugiat tincidunt. Morbi tortor libero, ultricies et libero et, blandit finibus felis. Morbi congue urna vel consequat condimentum. In luctus ante ac sapien fermentum suscipit. Nullam mattis neque sit amet luctus interdum. Sed aliquam luctus orci in rhoncus. Sed ac felis non ligula scelerisque vehicula. Donec at tellus ante.

Maecenas varius, erat eget gravida auctor, dui ligula maximus neque, ut venenatis est odio ac arcu. Aenean sodales orci velit, id ullamcorper nulla pretium a. Morbi ultricies odio ac ante suscipit porttitor. In interdum nunc lectus, eget varius odio scelerisque viverra. Praesent vulputate pretium dui, non hendrerit quam ornare nec. Donec tempor dui turpis, vel laoreet lacus finibus sed. Quisque id mattis felis, a fermentum justo. Sed ultricies suscipit dapibus. Nunc aliquam laoreet lectus, vel posuere mi scelerisque eleifend. Cras luctus dapibus nunc, vitae iaculis est pretium vitae. Maecenas mi neque, accumsan et venenatis at, semper in tortor. Donec augue erat, vehicula non aliquam quis, mattis id tortor.

Curabitur tempor, enim non convallis vulputate, odio dolor tempor nisl, ut accumsan sapien neque vel nulla. Mauris lacinia vulputate porta. Mauris elementum egestas lorem, sed sodales nibh efficitur ut. Cras tempor tellus sit amet lacus aliquet bibendum. Sed laoreet elementum neque, non viverra ex sollicitudin nec. Sed congue odio a dictum mollis. Curabitur convallis enim nulla, vitae finibus odio sollicitudin sit amet. Donec a lacus est. Phasellus nisi risus, elementum nec metus id, convallis molestie ligula. Vestibulum metus nulla, maximus at ullamcorper ac, venenatis sit amet diam. Morbi nisl lacus, facilisis a velit a, viverra fermentum est. Sed eget elit in tellus congue laoreet in at nisl. Aenean pulvinar pretium sollicitudin. Aliquam non ipsum feugiat, gravida nibh ut, venenatis nulla. Quisque ultricies dui elementum tellus convallis tempor eget id est.

Fusce ut ligula interdum felis posuere venenatis in sed tortor. Cras cursus eleifend metus, ut cursus nisl vestibulum vitae. Sed sed quam non dui tempor interdum sit amet id mauris. Maecenas consectetur mi lacus, sed suscipit metus vestibulum nec. Cras eget tincidunt tortor. In aliquam nulla eu sapien auctor, at pellentesque lectus euismod. Curabitur placerat purus odio, in interdum dolor dignissim eu. Maecenas porta ante gravida tincidunt scelerisque. Quisque at tortor malesuada, semper arcu sed, pretium augue. Maecenas enim orci, viverra ac enim quis, condimentum eleifend nisi."

	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	if(clickCount >= text_blocks.size()):
		disabled = true
		AudioManager.get_node("sfx_win").play()
		Global.gameWon = 1
	else:
		$"../text1".text = text_blocks[clickCount]
		clickCount += 1
	
