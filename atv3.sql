-- 1 

delimiter $$
create function inserirAluno(mat SMALLINT, cod SMALLINT, nasc date, cred int, mg float(10,2), nome varchar(50),email varchar(50))
returns varchar(50)
deterministic
begin
    declare nome_aluno varchar(50);
	insert into aluno values(mat,cod,nasc,cred,mg,nome,email);	
    set nome_aluno = nome;
	return nome;
end;
$$
delimiter ;

-- 2 

DELIMITER //
CREATE PROCEDURE sequencia()
main : BEGIN
	DECLARE contador INT DEFAULT 1;
    DECLARE selected varchar(50) default '1,';
     while contador < 5 do 
		set contador = contador + 1;
        set selected = concat( selected ,contador,',');
	 END WHILE;
     select selected;
END //
DELIMITER ;

-- 3

DELIMITER **
CREATE PROCEDURE sequencia_repita()
main : BEGIN
	DECLARE contador TINYINT DEFAULT 1;
    DECLARE selected varchar(50) default '1,';
    
    repeat
		set contador = contador + 1;
        set selected = concat( selected ,contador,',');
	UNTIL contador > 8
    end repeat;
    select selected;
END **
DELIMITER ;

