
##########################
#Melh omadas
#5343 Mallios Charalampos
#5228 Mantas Eleutherios
#5431 Stafidas Dimitrios
##########################

#!/bin/bash
clear

echo "Diaxeirish Pelatwn v.1.0"
echo""
echo "[1] Fortwsi arxeiou epixeirisewn"
echo [2] Provoli stoixeiwn epixeirisis
echo [3] Allagh stoixeiou epixeirisis		
echo [4] Provoli arxeiou
echo [5] Apothikeusi arxeiou
echo [6] Exodos

let a=0

while [ $a -ne  6 ]; do
read -p "enter a choise:" a


if [ "$a" == 1 ]
then
	echo "Pliktrologise to path.Ean thes na xrhsimopoithei to default pliktrologise none." 
	read path 
	echo " "
	
   
if [ -a  $path ] 
then 
    
	echo "Twra pliktrologise to onoma tou arxeiou"
        read input 
        sed -n '$r end' $input
        echo ok!file loaded

else 
        echo "De dwsate path! tha xrisimopoithei to default"
        input=clients.csv
        sed -n '$r end' $input
        echo ok!file loaded

#apothikeoume to arxeio se kathe periptwsh  se mia metablhth input gia na to xrhsimopoioume argotera              
      
fi 
			
elif [ "$a" == 2 ]; then 
                
	echo " Dwse id ths epixeirhshs"
        read id             	
                
        #briskoume thn epithymiti grammh me th boitheia ths awk 

	awk -F "," -v  id=$id  '{ if( id == $1 ) {print $0} }' $input



elif [ "$a" == 3 ]; then 
    
        echo Pliktrologise to id ths etaireias pou theleis na allakseis : 
	read id
	echo OK! mporeis na allakseis ena apo stoixeia ths epixeirisis        
        awk -F "," -v  id=$id '{ if( id == $1 ){print $0} }' $input 
      
        #edw pername thn epithymiti grammh sto allo2.txt pou einai temporary file

        awk -F "," -v  id=$id '{ if( id == $1 ) {print $0  }}' $input >> allo2.txt 
        
        echo " "  
        echo Dwse stoixeio allagis :
        read s1
        echo " "
        echo Dwse stoixeio pou tha to antikatastisei:
        read s2
        echo  To stoixeio allakse!
        echo " " 
        echo  H eggrafh prin thn allagh  htan :

	awk -F "," -v id=$id '{ if( id == $1 ) {print $0 }}' $input
    
	# edw pernaw  oles tis mh tropopoihmenes records tou input sto temp file test.txt 
	awk -F "," -v id=$id '{ if( id != $1 ) { print } }' $input > test.txt
    
	echo " "
	echo Twra exei ws eksis:
	#edw allazoume ta stoixeia pou edwse o xrhsths gia thn epithymhth record kai thn stelnoume tropopoihmneh sto temp file test.txt
	sed -n "s/$s1/$s2/gp" allo2.txt  >> test.txt 
	

	#edw printaroume th record gia na fanei h allagh 
      	awk -F ","  -v id=$id '{  if( id == $1) { print $0 }}' test.txt   
	#edw metaferoume to test.txt (arxeio me tis allages) sto temp.txt (pou einai ena temp file)
	mv test.txt   temp.txt
	#edw pername to temp.txt sto arxiko mas input
	input=temp.txt
  
	#edw katharizoume ta test kai allo2 temp files gia na mh records se periptwsh epomenhs ekteleshs tou 3
	#rm test.txt
	rm allo2.txt     
                

elif [ "$a" == 4 ]; then
  
	cat $input|more   #me to "|" kanoyme cat parallhla me th more
          

elif [ "$a" == 5 ]; then
 
        read -p "Dwse to  path pou thes na apothikeuseis to arxeio.Alliws pliktrologise none gia na xrisimopoithei to default:  " path1

if [ -a $path1 ]; then
	echo "Dwse to  onoma tou arxeiou pou thes  na apothikeutei"
	read input1
        echo " " 
	cp $input $input1
	echo the new file saved!
else
	input2=clients.csv
        cp $input $input2

	echo the file : clients.csv updated!
fi

#an o xrhsths mas dwsei path kai onoma arxeiou dhmiourgoume
#ena neo kai ayto tha exei tis allages pou 
#exoun ginei sto 3 diaforetika apothikeuontai sto default clients.csv
          

else [ "$a" == 6 ]

#kanoume exit apo to menou apla xrisimopoiontas thn entolh exit
  
exit    

fi

done   

