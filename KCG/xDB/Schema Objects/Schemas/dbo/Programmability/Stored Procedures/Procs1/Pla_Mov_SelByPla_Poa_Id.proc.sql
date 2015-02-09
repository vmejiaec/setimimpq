

CREATE PROCEDURE [dbo].[Pla_Mov_SelByPla_Poa_Id]
( @p_Pla_Poa_Id int )
AS
	SET NOCOUNT ON;
SELECT        
	Id, 
	Codigo, 
	Pla_Poa_Id, 
	Pla_Doc_Id, 
	Orden, 
	Valor, 
	Estado,
	Tipo,
	-- Poa Tarea
	(select p.Pla_Tarea_Id from Pla_Poa p where p.Id = Pla_Poa_Id) Pla_Tarea_Id,
	(select t.Nombre from Pla_Tarea t where t.Id = 
		(select p.Pla_Tarea_Id from Pla_Poa p where p.Id = Pla_Poa_Id)) Pla_Tarea_Nombre,
	-- Poa Partida
	(select p.Pla_Partida_Id from Pla_Poa p where p.Id = Pla_Poa_Id) Pla_Partida_Id,
	(select d.Codigo from Pla_Partida d where d.Id = 
		(select p.Pla_Partida_Id from Pla_Poa p where p.Id = Pla_Poa_Id)) Pla_Partida_Codigo,
	(select d.Nombre from Pla_Partida d where d.Id = 
		(select p.Pla_Partida_Id from Pla_Poa p where p.Id = Pla_Poa_Id)) Pla_Partida_Nombre,
	-- Doc
	(select doc.Tipo from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_Tipo,
	(select doc.Fecha_Planifica from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_Fecha,
	(select doc.Codigo from Pla_Doc doc where doc.Id = Pla_Doc_Id) Pla_Doc_Codigo,
	-- Pla_Cta
	(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = 
		(select p.Pla_Tarea_Id from Pla_Poa p where p.Id = Pla_Poa_Id)) Pla_Cta_Id,
	(select cta.Codigo from Pla_Cta cta where cta.Id =
		(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = 
			(select p.Pla_Tarea_Id from Pla_Poa p where p.Id = Pla_Poa_Id))) Pla_Cta_Codigo,
	(select cta.Nombre from Pla_Cta cta where cta.Id =
		(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = 
			(select p.Pla_Tarea_Id from Pla_Poa p where p.Id = Pla_Poa_Id))) Pla_Cta_Nombre,
	(select t.Codigo from Pla_Tarea t where t.Id = 
		(select p.Pla_Tarea_Id from Pla_Poa p where p.Id = Pla_Poa_Id)) Pla_Tarea_Codigo
FROM            
	Pla_Mov
where
	Pla_Poa_Id = @p_Pla_Poa_Id
order by 
	Pla_Doc_Id,
	Orden