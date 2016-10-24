#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use Irssi 'command_bind';

sub {
    my %data =
	(
	 'Ohnmacht' => 'action $0 13 sieht �*:.{-6 $1 13-}.:*� zur T�r hereinschlendern und sinkt ohnm�chtig zu Boden. "K�ss mich wach, $1." :-)',
	 'Vermisst' => 'action $0 13t�nzelt mit schwingenden H�ften auf �*:.{-6 $1 13-}.:*� zu und f�llt ihm um den Hals. " $1, ich hab dich ja sooo vermisst!"',
	 'Fesseln' => 'action $0 13fesselt �*:.{-6 $1 13-}.:*� am Channelpfosten fest und setzt sich auf sein Gesicht :-)',
	 'Verlassen' => 'action $0 13fragt �*:.{-6 $1\'s 13-}.:*� mit traurigem Blick: "Was, $1??? Du verl�sst mich??? Einfach so???" *wein*',
	 'D�nnschiss' => 'action $0 13entfaltet behutsam seinen After und spritzt �*:.{-6 $1 13-}.:*� gezielt ein Ladung D�nnschiss zwischen die Augen. ',
	 'Schmunzeln' => 'action $0 13kichert �*:.{-6 $1 13-}.:*� an. "Du bringst mich zum Schmunzeln, s��er $1. Das war ein lustiger Schabernack.. hihi."',
	 'Seife' => 'action $0 13sagt zu �*:.{-6 $1 13-}.:*� "Kreeeeeisch! Mir ist ein St�ckchen Seife runtergefallen. $1, w�rdest du es f�r mich aufheben???" :-)))',
	 'Lach mal 1' => 'action $0 13fl�stert zu �*:.{-6 $1 13-}.:*� : "Lach mal, Kleiner!" und rammt ihm butterweich seinen Stengel in den Arsch :-)',
	 'Spazieren' => 'action $0 13nimmt �*:.{-6 $1 13-}.:*� spontan an die Hand und geht mit ihm spazieren.',
	 'Vaseline' => 'action $0 13wirft �*:.{-6 $1 13-}.:*� mal ein D�schen Vaseline zu. "Dann klappts auch mit dem Nachbarn, $1." :-)))',
	 'Nasenstubbs' => 'action $0 13stubbst mal �*:.{-6 $1\'s 13-}.:*� Nase an und grinst frech.',
	 'Bitte bleib' => 'action $0 13h�ngt sich an �*:.{-6 $1\'s 13-}.:*� Slip und kreischt hysterisch " $1, BITTE BLEEEEIB!!!"',
	 'Zehn�gel' => 'action $0 13knabbert gen�sslich an �*:.{-6 $1s 13-}.:*� Zehn�gel. :-)',
	 'Mausalarm' => 'action $0 13ruft: 6<3)~~ 13<3)~~ 6<3)~~ 13.o�~*{- 6KRAAAAAAAISCH! MAUS-ALARM! 13-}*~�o. 6<3)~~ 13<3)~~ 6<3)~~',
	 'Fleischware' => 'action $0 13schneidet �*:.{-6 $1 13-}.:*� ein St�ck Fleisch aus dem Bein und schmuggelt es heimlich unter die Waren in der Fleischabteilung.',
	 'Hetero' => 'action $0 13sagt: "Hmmmm.. �*:.{-6 $1 13-}.:*� :-) Wenn ich hetero w�re, w�rde ich mir w�nschen, ein Homo zu sein, damit ich mir mit dir eine heisse Beziehung w�nschen k�nnte." :-)',
	 'Du mich auch' => 'action $0 13n�selt galant zu �*:.{-6 $1 13-}.:*� : "Du mich auch..."',
	 'Kopfabreiss' => 'action $0 13reisst �*:.{-6 $1 13-}.:*� sanft den Kopf ab und schl�rft sein "None-IQ"-Hirn aus. ',
	 'Spanische Fliege' => 'action $0 13schmiert �*:.{-6 $1 13-}.:*� eine Bemme und mischt heimlich etwas \'Spanische Fliege\' unter die Himbeermarmelade :-)',
	 'Betrachten' => 'action $0 13betrachtet �*:.{-6 $1 13-}.:*� mit gierigem Blick.',
	 'Kreischen' => 'action $0 13kreischt �*:.{-6 $1 13-}.:*� ganz schrill in sein h�bsches Gesicht. "Super Witz, $1!!!" :-)))',
	 'R�lpsen' => 'action $0 13r�lpst f�r �*:.{-6 $1 13-}.:*� das ABC. *r�lps*r�lps*r�lps* hihihi',
	 'Popoklapps' => 'action $0 13grinst �*:.{-6 $1 13-}.:*� frech an und sagt "Das war aber ungezogen, S��er." und gibt ihm keck einen kleinen Klapps auf seinen knackigen Popo. :-)',
	 'Brustwarze' => 'action $0 13saugt z�rtlich an �*:.{-6 $1\'s 13-}.:*� Brustwarze und leckt seinen Bauch.',
	 'Blick' => 'action $0 13zieht �*:.{-6 $1 13-}.:*� mit seinen Blicken f�rmlich aus.',
	 'Penis' => 'action $0 13betrachtet den harten Pullermann von �*:.{-6 $1 13-}.:*� und ber�hrt dessen Aischl vorsichtig mit der Zungenspitze.',
	 'L�cheln' => 'action $0 13schenkt �*:.{-6 $1 13-}.:*� ein s��es L�cheln. :-)',
	 'Tickfangen' => 'action $0 13schleicht sich von hinten an �*:.{-6 $1 13-}.:*� heran, ditscht ihn kurz an und l�uft lachend wieder weg. "Tickfangen - du bist! Hasch mich, $1!"',
	 'Umzingelt' => 'action $0 13l�uft im Kreis um �*:.{-6 $1 13-}.:*� herum und ruft "�tschib�tsch, du bist umzingelt, $1!" :-P',
	 'Kettens�ge' => 'action $0 13piekst �*:.{-6 $1 13-}.:*� neckisch mit einer kleinen Nadel und zers�gt ihn anschlie�end mit einer Kettens�ge. ',
	 'Ich war das nicht' => 'action $0 13t�nzelt im Zickzack auf �*:.{-6 $1 13-}.:*� zu, stellt sich hinter ihn und tippt ihn neckisch auf die Schulter. "Huhu $1, ich war das nicht.. hihihi."',
	 'Winker' => 'action $0 13 winkt �*:.{-6 $1 13-}.:*� mal fr�hlich zu. "Juhuuuuuuuuu, $1!" :-)))',
	 'Yoghurette' => 'action $0 13bietet �*:.{-6 $1 13-}.:*� seine Yoghurette an.',
	 'Ausweinen' => 'action $0 13weint sich an �*:.{-6 $1\'s 13-}.:*� kr�ftiger, behaarter Brust aus und betatscht ihn an ganz unversch�mt an omin�sen Stellen. :-)',
	 'Beleidigt' => 'action $0 13stemmt seine linke Hand in die H�fte und ist beleidigt. �*:.{ 6 $1 13 }.:*� PAH!',
	 'Zungenkuss' => 'action $0 13gibt �*:.{-6 $1 13-}.:*� einen langen, hei�en und innigen Zungenkuss und greift ihm dabei z�rtlich in den Slip.',
	 'Lied' => 'action $0 13holt seine Blockfl�te hervor und tr�llert �*:.{-6 $1 13-}.:*� ein h�bsches Lied. *fl����t* :-)',
	 'R�ckenhaar' => 'action $0 13wuschelt mal durch �*:.{-6 $1\'s 13-}.:*� R�ckenhaar.',
	 'Weiche Knie' => 'action $0 13 sieht �*:.{-6 $1 13-}.:*� zur T�r hereinkommen und bekommt auf einmal ganz weiche Knie.',
	 'Was sich neckt..' => 'action $0 13lacht zu �*:.{-6 $1 13-}.:*� her�ber und stellt fest: "Was sich neckt, das liebt sich, $1." :-)))',
	 'Regenbogen' => 'action $0 13hat ein kleines St�ck vom Regenbogen stiebitzt und schenkt es �*:.{ 6 $1 13 }.:*�',
	 'Watteb�llchen' => 'action $0 13bewirft �*:.{-6 $1 13-}.:*� mit tuffig weichen, rosa bauscheligen Watteb�llchen.',
	 'Tanz II' => 'action $0 13greift �*:.{-6 $1 13-}.:*� sanft um  die Taille, tanzt mit ihm eine Runde durch den Channel und bedankt sich mit einer 5@3}-}---',
	 'Zerst�ckel' => 'action $0 13zerst�ckelt �*:.{-6 $1 13-}.:*� in H�ppchen und isst ihn mit dem L�ffel. ',
	 'Luftballon' => 'action $0 13 schenkt �*:.{-6 $1 13-}.:*� zur Begr��ung einen rosaroten Luftballon. "Bittesehr, lieber $1!" :-)',
	 'Lach mal 2' => 'action $0 13ruft �*:.{-6 $1 13-}.:*� lachend zu: "Nun lach doch mal, sonst steck ich dir meinen Piepmatz soweit rein, bis meine Eichel dein Zwerchfell kitzelt." :-)',
	 'Schnute ziehen' => 'action $0 13zieht eine Schnute und wendet sich von *:.{-6 $1 13-}.:*� ab.',
	 'Tanz I' => 'action $0 13schnappt sich mal spontan den �*:.{-6 $1 13-}.:*� und tanzt mit ihm eine Runde durch den Saal.',
	 'Biene' => 'action $0 13fragt ganz ungeniert: "Du.. �*:.{-6 $1 13-}.:*�.. :-) Ich bin die \'Biene Jochen\'.. darf ich dich mal stechen?" Hihihi :-) BssSSssSSsssSsssss.. *pieks*..',
	 'Poloch' => 'action $0 13bietet �*:.{-6 $1 13-}.:*� h�flicherweise zur Begr��ung sein Poloch an. :-)',
	 'Tasse' => 'action $0 13verschweigt �*:.{-6 $1 13-}.:*�, dass er ihm zuvor in die Tasse gepullert hat. *fg*',
	 'Kuss' => 'action $0 13gibt �*:.{-6 $1 13-}.:*� einen 6langen, 13unheimlich intensiven, 6warmen, 13leidenschaftlichen, 6unbeschreiblich liebevollen, 13megageilen, 6unglaublichen, 13verr�ckten, 6in-den-Himmel-hebenden, 13wahnsinnigen, 6weichen, 13z�rtlichen, 6romantischen 13und unvergesslichen Kuss :X: ',
	 'Hei�e Nacht' => 'action $0 13be�ugt �*:.{-6 $1 13-}.:*� von oben bis unten, l�chelt ihn s�� an und fragt verf�hrerisch, ob er Lust auf eine hei�e Nacht zu zweit hat. :-)',
	 'Anfassen?' => 'action $0 13schaut �*:.{-6 $1 13-}.:*� mit gro�en Augen an und fragt ganz lieb " $1, darf ich dich anfassen?"',
	 'Abschiedskuss' => 'action $0 13umarmt �*:.{-6 $1 13-}.:*� ein letztes Mal und gibt ihm einen warmen Abschiedskuss.',
	 'Rasieren' => 'action $0 13rasiert �*:.{-6 $1 13-}.:*� die Beine. :-)',
	 'Umdrehen' => 'action $0 13dreht sich extra f�r �*:.{-6 $1 13-}.:*� um und b�ckt sich gaaaaaaanz tief nach der Seife.',
	 'Verliebt' => 'action $0 13gesteht �*:.{-6 $1 13-}.:*� mit roten Ohren, dass er sich in ihn verliebt hat.',
	 'Ranschleichen' => 'action $0 13schleicht sich langsam von hinten an �*:.{-6 $1 13-}.:*� heran und rammt ihm heimlich den Pullermann in den Kacka-Popo �:-p ',
	 'About' => 'action $0 13ist bewaffnet mit dem �~*{- 6h 13a 6P 13P 6Y 13* 6G 13a 6Y 13* 6P 13o 6P 13u 6P 13-}*~� - 6� 2001-5 by hen and Dirty Dave 13[v1.5+perl]',
	 'Vermiss' => 'action $0 13vermisst seinen �*:.{-6 $1 13-}.:*� schon jetzt.. *seufz* :-(',
	 );

    foreach(keys %data) {
	my $k = $_;

	$k =~ tr/A-Z/a-z/;
	$k =~ tr/a-z0-9/_/c;

	$k = "happygay_$k";

	$data{$k} = $data{$_};
	delete $data{$_};
    }

    while(my($k, $v) = each %data) {
	print ">> $k";

	command_bind(lc($k), sub {
	    my($data, $server, $witem) = @_;

	    if($server eq '0') {
		print "%R>> Usage: /$k <nickname>";
	    } else {
		$data =~ s/\s+//g;

		my $x = $v;

		my @rep = ($witem->{name}, $data);

		$x =~ s/\$(\d+)/$rep[$1]/ge;

		$server->command($x);
	    }
	});
    }

    command_bind('list_happygay', sub {
	foreach(sort keys %data) {
	    print join ' -> ', $_, $data{$_};
	}
    });
}->();
