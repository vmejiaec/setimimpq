
create function Pla_Mov_SumaMovsReasignacion_ByPla_Poa_Id
(
	@v_Pla_Poa_Id int  
)
returns numeric(17,4)
as
begin

declare @v_suma_movs_reasignacion  numeric(17,4)

select @v_suma_movs_reasignacion = sum(datos.Valor_para_Sumar) from
(
	select 
			case mov.Tipo
			when 'CRE' then + mov.Valor -- CREdito positivo (+)
			when 'DEB' then - mov.Valor -- DEBito negativo (-)
			end Valor_para_Sumar
	from Pla_Mov mov
	where 
		 mov.Pla_Poa_Id = @v_Pla_Poa_Id
	 and (select doc.Tipo from Pla_Doc doc where doc.Id= mov.Pla_Doc_Id) = 'REP'
	 ) datos
	 
	 select @v_suma_movs_reasignacion = isnull(@v_suma_movs_reasignacion,0)
	 
	 return @v_suma_movs_reasignacion 

 end