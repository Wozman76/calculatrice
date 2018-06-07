program calculatrice;

uses sysutils;


function nombre( str : String) : Integer;
var nb : Integer;
begin
	if str[1] = '-' then
		nb := -1 * StrToInt(copy(str, 2, length(str) - 1))
	else nb := StrToInt(str);
	
	nombre := nb;
end;

function prochainOperateur(str : String; prec : Word) : Word;
var suivant : Word;
	trouve : Boolean;
	
begin
	trouve := false;
	suivant := prec + 1;
	while not(trouve) and (suivant <= length(str)) do
		if (str[suivant] = '+') or (str[suivant] = '-') then
			trouve := true
		else suivant := suivant + 1;
	prochainOperateur := suivant;
	
end;



function calculer(str : String) : Integer;
var a, b, resultat, valOP : Integer;
	operande : String;
begin
	b := prochainOperateur(str, 1);
	operande := copy(str, 1, b - 1);
	a := b;
	resultat := nombre(operande);
	while a <= length(str) do
		begin

			b := prochainOperateur(str, a);
			operande := copy(str, a + 1, b - a - 1);
			valOP := nombre(operande);
			if str[a] = '+' then
				resultat := resultat + valOP
			else if str[a] = '-' then
					resultat := resultat - valOp;
			a := b;
		end;
	calculer := resultat;




end;



procedure saisie(var str : String);
begin
	writeln('Rentrez votre calcul');
	readln(str);

end;


var str : String;

BEGIN

	saisie(str);
	writeln('Le resultat de ' + str + ' est : ',  calculer(str));



END.
