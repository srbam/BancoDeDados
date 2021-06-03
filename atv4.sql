-- insert
DELIMITER $$
CREATE TRIGGER tri_vendas_ai
after INSERT ON comivenda
FOR EACH ROW
BEGIN
	declare vtotal_itens float(10,2) default 0;
    declare vtotal_item float(10,2);
    declare total_item float(10,2);
    
	 declare busca_itens cursor for
		select sum(n_valoivenda) 
		from comivenda
        where n_numevenda = new.n_numevenda;
	
    open busca_itens;
    
    fetch busca_itens into total_item;
  
    close busca_itens;
    update comvenda set n_totavenda = total_item
     where n_numevenda = new.n_numevenda;
end $$
DELIMITER ;

-- update
DELIMITER $$
CREATE TRIGGER tri_vendas_au
after update ON comivenda
FOR EACH ROW
BEGIN
	declare vtotal_itens float(10,2) default 0;
    declare vtotal_item float(10,2);
    declare total_item float(10,2);
    
	 declare busca_itens cursor for
		select sum(n_valoivenda) 
		from comivenda
        where n_numevenda = new.n_numevenda;
	
    open busca_itens;
    
    fetch busca_itens into total_item;
  
    close busca_itens;
    update comvenda set n_totavenda = total_item
     where n_numevenda = new.n_numevenda;
end $$
DELIMITER ;
