<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1414966018689" ID="ID_490382052" MODIFIED="1414966456769" TEXT="devops">
<node CREATED="1414966386382" HGAP="50" ID="ID_776885793" MODIFIED="1414966552733" POSITION="right" TEXT="in between DEV &amp; OPS" VSHIFT="2">
<node CREATED="1414966468983" ID="ID_1274819970" MODIFIED="1414966474102" TEXT="bugtracking">
<node CREATED="1414966477220" ID="ID_1406544437" MODIFIED="1414966479280" TEXT="JIRA"/>
<node CREATED="1414966483581" ID="ID_68454356" MODIFIED="1414966485578" TEXT="Mantis"/>
</node>
</node>
<node CREATED="1414966030695" ID="ID_1267750787" MODIFIED="1414966110975" POSITION="right" TEXT="DEVeloppement" VGAP="1">
<node CREATED="1414966184865" ID="ID_147265966" MODIFIED="1414966207598" TEXT="IDE integrations" VSHIFT="1">
<node CREATED="1414966917885" ID="ID_824487441" MODIFIED="1414966919865" TEXT="Idea"/>
<node CREATED="1414966939664" ID="ID_133791867" MODIFIED="1414966941936" TEXT="Eclipse"/>
</node>
<node CREATED="1414966045904" ID="ID_1428696258" MODIFIED="1414966340841" TEXT="build continu">
<arrowlink DESTINATION="ID_1428696258" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1130835725" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1428696258" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1130835725" SOURCE="ID_1428696258" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1414966114935" ID="ID_1225117684" MODIFIED="1414966123243" TEXT="SCM">
<node CREATED="1414966170370" ID="ID_259352561" MODIFIED="1414966173137" TEXT="subversion"/>
<node CREATED="1414966176963" ID="ID_571833090" MODIFIED="1414966178512" TEXT="git"/>
</node>
<node CREATED="1414966127470" ID="ID_148410579" MODIFIED="1414966634057" TEXT="continu">
<node CREATED="1414966132558" ID="ID_1821117801" MODIFIED="1415011879447" TEXT="jenkins">
<arrowlink DESTINATION="ID_535096643" ENDARROW="Default" ENDINCLINATION="48;0;" ID="Arrow_ID_1669517281" STARTARROW="None" STARTINCLINATION="48;0;"/>
</node>
<node CREATED="1414966138432" ID="ID_1553451784" MODIFIED="1414966691878" TEXT="bamboo (atlassian)">
<arrowlink DESTINATION="ID_535096643" ENDARROW="Default" ENDINCLINATION="87;0;" ID="Arrow_ID_721574400" STARTARROW="None" STARTINCLINATION="87;0;"/>
</node>
</node>
<node CREATED="1414966638139" ID="ID_308845579" MODIFIED="1414966644905" TEXT="tools">
<node CREATED="1414966606959" ID="ID_535096643" MODIFIED="1415011879447" TEXT="maven">
<linktarget COLOR="#b0b0b0" DESTINATION="ID_535096643" ENDARROW="Default" ENDINCLINATION="48;0;" ID="Arrow_ID_1669517281" SOURCE="ID_1821117801" STARTARROW="None" STARTINCLINATION="48;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_535096643" ENDARROW="Default" ENDINCLINATION="87;0;" ID="Arrow_ID_721574400" SOURCE="ID_1553451784" STARTARROW="None" STARTINCLINATION="87;0;"/>
</node>
<node CREATED="1414966651048" ID="ID_1299248488" MODIFIED="1414966653668" TEXT="gradle"/>
<node CREATED="1414966656551" ID="ID_1947165095" MODIFIED="1414966658651" TEXT="sbt"/>
</node>
<node CREATED="1414966331520" ID="ID_1503387691" MODIFIED="1414966338124" TEXT="code analysis quality">
<node CREATED="1414966356172" ID="ID_744438299" MODIFIED="1414966360802" TEXT="sonar qube"/>
<node CREATED="1414966365302" ID="ID_1863311088" MODIFIED="1414966367571" TEXT="findbugs"/>
<node CREATED="1414966370526" ID="ID_1762429023" MODIFIED="1414966375647" TEXT="checkstyle"/>
<node CREATED="1414966591882" ID="ID_291713274" MODIFIED="1414966595664" TEXT="cast"/>
</node>
</node>
</node>
<node CREATED="1414966077157" ID="ID_1291228262" MODIFIED="1414966105242" POSITION="right" TEXT="OP&#xe9;rationS">
<node CREATED="1414966160178" ID="ID_96390740" MODIFIED="1414966166768" TEXT="int&#xe9;gration continue">
<node CREATED="1414966213551" ID="ID_1972263497" MODIFIED="1414966218460" TEXT="OS level">
<node CREATED="1414966221877" ID="ID_1128809089" MODIFIED="1414966231349" TEXT="machines virtuelles">
<node CREATED="1414966234601" ID="ID_1324553030" MODIFIED="1414966243583" TEXT="VMWare / VSphere"/>
<node CREATED="1414966247261" ID="ID_1095013648" MODIFIED="1414966287237" TEXT="Virtual Box"/>
<node CREATED="1414966291780" ID="ID_1502605248" MODIFIED="1414966301183" TEXT="Microsoft Hyper V"/>
</node>
<node CREATED="1414966257255" ID="ID_1578189805" MODIFIED="1414966273976" TEXT="Containers">
<node CREATED="1414966277399" ID="ID_726433321" MODIFIED="1414966281443" TEXT="Linux Containers">
<node CREATED="1415011902473" ID="ID_1485731377" MODIFIED="1415011909930" TEXT="LXC"/>
<node CREATED="1414966305498" ID="ID_1933310653" MODIFIED="1414966308061" TEXT="docker"/>
<node CREATED="1414966311074" ID="ID_96152621" MODIFIED="1414966313477" TEXT="Vagrant"/>
</node>
</node>
</node>
<node CREATED="1414966778795" ID="ID_76816522" MODIFIED="1414967526274" TEXT="configuration automatique">
<node CREATED="1415789705442" ID="ID_1396346059" MODIFIED="1415789710794" TEXT="packer">
<node CREATED="1415789715579" ID="ID_1935278985" MODIFIED="1415789772124" TEXT="permet de construire automatiquement des distributions (sous forme de BOX) pour vagrant avec support en particulier de virtualbox et vmware. Peut s&apos;int&#xe9;grer avec un certain nombre de providers (pas juste vagrant)"/>
</node>
<node CREATED="1414967555065" ID="ID_1288393447" MODIFIED="1414967900714" TEXT="Push">
<node CREATED="1414966790880" ID="ID_689849034" LINK="#ID_332238662" MODIFIED="1414967735457" STYLE="fork" TEXT="ansible">
<node CREATED="1414967178796" ID="ID_633388103" MODIFIED="1414968215468" STYLE="fork" TEXT=" Ansible est un outil permettant de pousser des configuration au travers de ssh. &#xa;- Les configuration sont regroup&#xe9;es au travers d&apos;un playbook.- la configuration est pouss&#xe9; a chaque run d&apos;un playbook    &#xa;- ne n&#xe9;cessite pas d&apos;installation particuli&#xe8;re sur les machine administr&#xe9;e    &#xa;- tout se passe au travers de ssh    &#xa;- le format des playbook sont des fichier de configuration + template    &#xa;- il existe plein de playbook (galaxy)    &#xa;- ecrit en python    &#xa;- les derni&#xe8;re version commencent a supporter windows    &#xa;- Tr&#xe8;s bonne documentation    &#xa;- Projet qui monte "/>
</node>
</node>
<node CREATED="1414967591091" ID="ID_1241924094" MODIFIED="1414967920730" TEXT="Pull">
<node CREATED="1414966805398" ID="ID_384976883" LINK="#ID_1850863719" MODIFIED="1414966876599" TEXT="chef">
<node CREATED="1414967322987" ID="ID_24294884" MODIFIED="1414968490534" TEXT="concurrent de puppet: &#xa;- &#xe9;crit en Erlang&#xa;- Utilise un agent qui doit &#xea;tre install&#xe9; sur la machine &#xe0; g&#xe9;rer&#xa;- Les &#xe9;changes se font au travers d&apos;un tunnel ssl     &#xa;- L&apos;agent v&#xe9;rifie p&#xe9;riodiquement que la configuration du serveur n&apos;a pas boug&#xe9; (30min) et &#xe9;crase les fichiers &#xe9;ventuellement modifi&#xe9; a la main     &#xa;- Documentation cauchemardesque !!!     &#xa;- Incompatibilit&#xe9; entre les version     &#xa;- Projet d&#xe9;j&#xe0; ancien et de moins en moins utilis&#xe9;     &#xa;- Les configurations sont d&#xe9;crite a l&apos;aide d&apos;un DSL Ruby     &#xa;- Grosse communaut&#xe9;     &#xa;- existe en version commerciale"/>
</node>
<node CREATED="1414966809379" ID="ID_1309280029" MODIFIED="1414967251557" TEXT="puppet">
<node CREATED="1414967804916" ID="ID_114959026" MODIFIED="1414968185244" TEXT="Puppet  plus ancien qu&apos;ansible, permet de g&#xe9;rer la configuration de machine: &#xa;- &#xe9;crit en ruby     &#xa;- Utilise un agent qui doit &#xea;tre installer sur la machine a g&#xe9;rer&#xa;- Les &#xe9;changes se font au travers d&apos;un tunnel ssl     &#xa;- La configuration du serveur doit &#xea;tre pr&#xe9;vue d&#xe8;s le d&#xe9;part pour &#xea;tre scalable     &#xa;- L&apos;agent v&#xe9;rifie p&#xe9;riodiquement que la configuration du serveur n&apos;a pas boug&#xe9;e (30min) et &#xe9;crase les fichiers &#xe9;ventuellement modifi&#xe9; a la main     &#xa;- bonne documentation     &#xa;- Projet d&#xe9;j&#xe0; ancien et largerment utilis&#xe9;     &#xa;- Les configurations sont d&#xe9;crite a l&apos;aide d&apos;un DSL Ruby     &#xa;- Grosse communaut&#xe9; (puppet forge)         &#xa;- Les agents pull la configuration du serveur"/>
</node>
<node CREATED="1414967983472" ID="ID_1147552030" MODIFIED="1414967987489" TEXT="salt">
<node CREATED="1414967990871" ID="ID_85101313" MODIFIED="1414968152652" TEXT="Salt fonctionne sous le m&#xea;me principe que puppet    : &#xa;- &#xe9;crit en python     &#xa;- Utilise un agent qui doit &#xea;tre install&#xe9; sur la machine &#xe0; g&#xe9;rer&#xa;- Les &#xe9;changes se font au travers de 0mq     &#xa;- La configuration du serveur est plus simple que puppet     &#xa;- L&apos;agent v&#xe9;rifie p&#xe9;riodiquement que la configuration du serveur n&apos;a pas boug&#xe9;e (30min) et &#xe9;crase les fichiers &#xe9;ventuellement modifi&#xe9; a la main     &#xa;- bonne documentation     &#xa;- Projet assez jeune     &#xa;- le format des playbook sont des fichier de configuration + template         &#xa;- Les agents pull la configuration du serveur     &#xa;- les agents existent pour windows "/>
</node>
</node>
<node CREATED="1414966798868" ID="ID_1593193996" LINK="#ID_1529864445" MODIFIED="1414966845486" TEXT="capistrano">
<node CREATED="1414968075853" ID="ID_1025304906" MODIFIED="1414968165728" TEXT="C&apos;est un outils a l&apos;origine fait pour d&#xe9;ployer du ruby on rail mais utilisable pour automatiser des d&#xe9;ployements php ou autres. Ce n&apos;est pas un outil de gestion de configuration a proprement parler mais permet de pousser de la conf:&#xa;- Projet ancien         &#xa;- Bien pour pousser une application et sa conf sur un serveur         &#xa;- A utiliser en compl&#xe9;ment         &#xa;- Ecrit en ruby         &#xa;- configuration facon DSL Ruby"/>
</node>
<node CREATED="1414966827178" ID="ID_59715584" MODIFIED="1414967889436" TEXT="the foreman"/>
<node CREATED="1414967480093" ID="ID_1606715654" MODIFIED="1414967491121" TEXT="Infrastructure as Code">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1414967492344" ID="ID_142663691" MODIFIED="1415011962166" TEXT="">
<node CREATED="1414967493964" ID="ID_664854266" MODIFIED="1415011973180" TEXT="versioning de l&apos;&#xe9;tat de l&apos;infrastructure"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1414966503349" ID="ID_1225901733" MODIFIED="1414966506050" POSITION="left" TEXT="Cloud">
<node CREATED="1414966508869" ID="ID_1191046023" MODIFIED="1414966518157" TEXT="API">
<arrowlink DESTINATION="ID_1191046023" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_532037960" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1191046023" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_532037960" SOURCE="ID_1191046023" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1414966513063" ID="ID_989401421" MODIFIED="1414966516617" TEXT="Amazon EC2"/>
<node CREATED="1414966520059" ID="ID_78424539" MODIFIED="1414966523161" TEXT="OpenStack"/>
<node CREATED="1414967370068" ID="ID_1841005929" MODIFIED="1414967373995" TEXT="Google"/>
</node>
<node CREATED="1414967430536" ID="ID_166571216" MODIFIED="1415011931115" TEXT="SAAS: Software As a Service">
<node CREATED="1414967442822" ID="ID_1837404064" MODIFIED="1414967445680" TEXT="Salesforces"/>
</node>
<node CREATED="1414967405412" ID="ID_1206417747" MODIFIED="1415011935241" TEXT="PAAS: Platform as a Service"/>
<node CREATED="1414967390888" ID="ID_1347056014" MODIFIED="1414967402138" TEXT="IAAS: Infrastructure as a Service"/>
<node CREATED="1414967454566" ID="ID_1309863412" MODIFIED="1414967466199" TEXT="BAAS: Bare Metal as a Service"/>
</node>
<node CREATED="1414966727117" ID="ID_976696945" MODIFIED="1414966730756" POSITION="left" TEXT="Langages">
<node CREATED="1414966733778" ID="ID_1882392660" MODIFIED="1414966735974" TEXT="Java"/>
<node CREATED="1414966738745" ID="ID_332238662" MODIFIED="1414966741064" TEXT="Python"/>
<node CREATED="1414966744885" ID="ID_1529864445" MODIFIED="1414966746820" TEXT="Ruby"/>
<node CREATED="1414966750119" ID="ID_1850863719" MODIFIED="1414966752387" TEXT="Erlang"/>
</node>
<node CREATED="1414968328485" ID="ID_1361155936" MODIFIED="1414968335687" POSITION="left" TEXT="Organisation des &#xe9;quipes">
<node CREATED="1414968344337" ID="ID_1107694633" MODIFIED="1414968370846" TEXT="classique: dev &amp; ops s&#xe9;par&#xe9;s, peu d&apos;automatisation">
<icon BUILTIN="stop-sign"/>
</node>
</node>
</node>
</map>
