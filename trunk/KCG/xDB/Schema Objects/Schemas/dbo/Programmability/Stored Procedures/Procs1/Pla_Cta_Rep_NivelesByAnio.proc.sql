
CREATE procedure [dbo].[Pla_Cta_Rep_NivelesByAnio]
(
	@p_Anio varchar(4) = '2014'
)
as 
SELECT        
	Id, 
	Codigo,	
	-- Ctas por niveles
	dbo.Pla_Cta_Padre_Nivel01(@p_Anio,(select c.Codigo from Pla_Cta c where c.Id = Pla_Cta_Id)) Nivel01,
	dbo.Pla_Cta_Padre_Nivel02(@p_Anio,(select c.Codigo from Pla_Cta c where c.Id = Pla_Cta_Id)) Nivel02,
	dbo.Pla_Cta_Padre_Nivel03(@p_Anio,(select c.Codigo from Pla_Cta c where c.Id = Pla_Cta_Id)) Nivel03,
	dbo.Pla_Cta_Padre_Nivel04(@p_Anio,(select c.Codigo from Pla_Cta c where c.Id = Pla_Cta_Id)) Nivel04,	
	Nombre, 
	Fecha_Ini, 
	Fecha_Fin, 
	Estado,
	-- Movimiento inicial en todos los poas de la tarea
	isnull(
	(select sum (dbo.[Pla_Mov_ValorInicial_ByPla_Poa_Id](p.Id))
		from Pla_Poa p 
		where p.Pla_Tarea_Id = t.Id 
	),0) Valor_Inicial,
	-- Suma de todos los movimientos de todos los poas de la tarea
	isnull(
	(select sum(dbo.[Pla_Mov_SumaMovs_ByPla_Poa_Id](p.Id)) 
		from Pla_Poa p 
		where p.Pla_Tarea_Id = t.Id 
	),0)Valor_Suma,
	-- Suma de todos los movimientos de reasignacion de todos los poas de la tarea
	isnull(
	(select sum(dbo.Pla_Mov_SumaMovsReasignacion_ByPla_Poa_Id(p.Id)) 
		from Pla_Poa p 
		where p.Pla_Tarea_Id = t.Id 
	),0)Valor_Suma_Movs_Reasignacion,
	-- Suma de los movimientos del tipo CER certificacion
	isnull(
		(select SUM(mov.Valor) from Pla_Mov mov 
			where mov.Pla_Poa_Id in (select poa.Id from Pla_Poa poa where poa.Pla_Tarea_Id = t.Id)
			  and (select doc.Tipo from Pla_Doc doc where doc.Id = mov.Pla_Doc_Id) = 'CER')
	,0) Valor_Suma_Movs_Certificados
FROM            
	Pla_Tarea t
where
	t.Pla_Cta_Id in (select c.Id from Pla_Cta c where c.Anio = @p_Anio)
order by Nivel01, Nivel02, Nivel03, Nivel04, Codigo