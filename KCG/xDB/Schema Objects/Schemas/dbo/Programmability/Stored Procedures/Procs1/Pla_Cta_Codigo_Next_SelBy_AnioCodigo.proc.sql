
CREATE procedure [dbo].[Pla_Cta_Codigo_Next_SelBy_AnioCodigo]
(
  @p_Anio varchar(4),
  @p_Codigo varchar(100)
)
as
select 
	x.Codigo,
	x.Cta_Bro_Next,
	case LEN( x.Cta_Bro_Next)
	when 3 then 'PRG'
	when 6 then 'PRY'
	when 9 then 'PRD'
	when 12 then 'ACT'
	end Nivel_Bro,
	x.Cta_Son_Next,
	case LEN( x.Cta_Son_Next)
	when 0 then ''
	when 3 then 'PRG'
	when 6 then 'PRY'
	when 9 then 'PRD'
	when 12 then 'ACT'
	end Nivel_Son
from
(
select 
	Codigo, 
	dbo.pla_cta_Bro_Next(Anio,codigo) Cta_Bro_Next,
	dbo.pla_cta_Son_Next(Anio,Codigo) Cta_Son_Next
	from Pla_Cta
	where Anio = @p_Anio and Codigo = @p_Codigo
) x
