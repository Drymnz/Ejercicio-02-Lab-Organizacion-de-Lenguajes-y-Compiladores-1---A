/*primer seccion: codigo de usuario*/
package com.mycompany.practicajflex.jflex;

%%

/*segunda seccion: configuracion*/
%class CounterLexer
%unicode
%line
%column
%int
%public
%ignorecase
%standalone

%{
    private String listNumber = " Listado :";

    private int countOneVowel = 0;
    private int countTwoVowel = 0;
    private int countThreeVowel = 0;
    private int countFourVowel = 0;
    private int countFiveVowel = 0;

    private int countNum = 0;
    private int countError = 0;

    //incrase
    //vowel
    public void increaseOneVowel() {
        countOneVowel++;
    }

    public void increaseTwoVowel() {
        countTwoVowel++;
    }

    public void increaseThreeVowel() {
        countThreeVowel++;
    }

    public void increaseFourVowel() {
        countFourVowel++;
    }

    public void increaseFiveVowel() {
        countFiveVowel++;
    }

    //fin vowel
    public void increaseNum() {
        listNumber += "\nEl numero : <"+yytext()+"><Linea\"" + (yyline+1) + "\">" + "<Columna\"" + yycolumn + "\">";
        countNum++;
    }

    public void increaseError() {
        countNum++;
    }
    //fin incrase

    // get
    public int getCountOneVowel() {
        return countOneVowel;
    }

    public int getCountTwoVowel() {
        return countTwoVowel;
    }

    public int getCountThreeVowel() {
        return countThreeVowel;
    }

    public int getCountFourVowel() {
        return countFourVowel;
    }

    public int getCountFiveVowel() {
        return countFiveVowel;
    }

    public int getCountNum() {
        return countNum;
    }

    public int getCountError() {
        return countError;
    }

    public String getListNumber() {
        return listNumber;
    }

    // fin get
%}

numero          =[0-9]+
unaVocal        =[q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*
dosVocal        =[q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*
tresVocal       =[q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*
cuatroVocal     =[q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*
cincoVocal      =[q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*[a|e|i|o|u][q|w|r|t|y|p|ñ|l|k|j|h|g|f|d|s|z|x|c|v|b|n|m]*
%%

/*tercer seccion: reglase lexicas*/
/*entero*/
{numero}        {
		increaseNum();
                }
{cincoVocal}    {
		increaseFiveVowel();
                }
{cuatroVocal}   {
		increaseFourVowel();
                }
{tresVocal}     {
		increaseThreeVowel();
                }
{dosVocal}      {
		increaseTwoVowel();
                }
{unaVocal}      {
		increaseOneVowel();
                }

[\r|\t|\f|\n|\s]  {}

[^] {
    System.out.println("no pertenece al alfabeto");
    }