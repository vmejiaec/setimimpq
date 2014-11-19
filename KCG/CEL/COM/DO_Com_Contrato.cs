using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.ComprasTableAdapters;
using AEL.COM;
using BEL;
using System.Data.SqlClient;

namespace CEL.COM
{
    public class DO_Com_Contrato
    {
	// adapter
    public Com_ContratoTableAdapter Adapter = new Com_ContratoTableAdapter();
	//Select
	public List<Com_Contrato> Get(Scope s)
    {
        List<Com_Contrato> lista = new List<Com_Contrato>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Contrato(
				fila.Id,
fila.Pla_Doc_Id,
fila.Estado,
fila.Com_Procedimiento_Id,
fila.Porcentaje_Anticipo_Ref,
fila.Plazo_Ref,
fila.Codigo_Sercop,
fila.Per_Personal_Resp_Exp,
fila.Fecha_Cierre_Rec_Ofertas,
fila.Par_Razon_Social_Id_Contratista,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Fecha_Inicio_Contrato,
fila.Porcentaje_Anticipo_Contrato,
fila.Per_Personal_Id_Admin,
fila.Desc_Contrata,
fila.Fecha_Crea,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Per_Personal_Nombre_Admin,
fila.Valor_Suma_Movs,
fila.Com_Procedimiento_Tipo,
fila.Com_Procedimiento_Nombre,
fila.Per_Personal_Nombre_Resp_Exp,
fila.Per_Personal_Id_Solicita,
fila.Per_Personal_Nombre_Solicita,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista,
fila.Pla_Doc_Cedula_Presup_Codigo,
fila.Pla_Doc_CPC_Codigo,
fila.Pla_Doc_PAC_Linea,
fila.Pla_Doc_Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Doc_Valor_Solicita,
fila.Com_Procedimiento_Desc,
fila.Estado_Portal,
fila.Estado_Contratacion,
fila.Fecha_Inicio_Elabora_Pliegos,
fila.Fecha_Publicacion_Portal,
fila.Fecha_Calificaciones,
fila.Fecha_Estimada_Adjudicacion,
fila.Fecha_Adjudicacion,
fila.Fecha_Juridico
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Contrato n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Pla_Doc_Id,
n.Estado,
n.Com_Procedimiento_Id,
n.Porcentaje_Anticipo_Ref,
n.Plazo_Ref,
n.Codigo_Sercop,
n.Per_Personal_Resp_Exp,
n.Fecha_Cierre_Rec_Ofertas,
n.Par_Razon_Social_Id_Contratista,
n.Valor_Contrato,
n.Plazo_Contrato,
n.Fecha_Inicio_Contrato,
n.Porcentaje_Anticipo_Contrato,
n.Per_Personal_Id_Admin,
n.Desc_Contrata,
n.Fecha_Crea,
n.Com_Procedimiento_Desc,
n.Estado_Portal,
n.Estado_Contratacion,
n.Fecha_Inicio_Elabora_Pliegos,
n.Fecha_Publicacion_Portal,
n.Fecha_Calificaciones,
n.Fecha_Estimada_Adjudicacion,
n.Fecha_Adjudicacion,
n.Fecha_Juridico
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Contrato o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Pla_Doc_Id,
o.Estado,
o.Com_Procedimiento_Id,
o.Porcentaje_Anticipo_Ref,
o.Plazo_Ref,
o.Codigo_Sercop,
o.Per_Personal_Resp_Exp,
o.Fecha_Cierre_Rec_Ofertas,
o.Par_Razon_Social_Id_Contratista,
o.Valor_Contrato,
o.Plazo_Contrato,
o.Fecha_Inicio_Contrato,
o.Porcentaje_Anticipo_Contrato,
o.Per_Personal_Id_Admin,
o.Desc_Contrata,
o.Fecha_Crea,
o.Com_Procedimiento_Desc,
o.Estado_Portal,
o.Estado_Contratacion,
o.Fecha_Inicio_Elabora_Pliegos,
o.Fecha_Publicacion_Portal,
o.Fecha_Calificaciones,
o.Fecha_Estimada_Adjudicacion,
o.Fecha_Adjudicacion,
o.Fecha_Juridico
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Contrato o, Com_Contrato n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Pla_Doc_Id,
n.Estado,
n.Com_Procedimiento_Id,
n.Porcentaje_Anticipo_Ref,
n.Plazo_Ref,
n.Codigo_Sercop,
n.Per_Personal_Resp_Exp,
n.Fecha_Cierre_Rec_Ofertas,
n.Par_Razon_Social_Id_Contratista,
n.Valor_Contrato,
n.Plazo_Contrato,
n.Fecha_Inicio_Contrato,
n.Porcentaje_Anticipo_Contrato,
n.Per_Personal_Id_Admin,
n.Desc_Contrata,
n.Fecha_Crea,
n.Com_Procedimiento_Desc,
n.Estado_Portal,
n.Estado_Contratacion,
n.Fecha_Inicio_Elabora_Pliegos,
n.Fecha_Publicacion_Portal,
n.Fecha_Calificaciones,
n.Fecha_Estimada_Adjudicacion,
n.Fecha_Adjudicacion,
n.Fecha_Juridico,
o.Id,
o.Pla_Doc_Id,
o.Estado,
o.Com_Procedimiento_Id,
o.Porcentaje_Anticipo_Ref,
o.Plazo_Ref,
o.Codigo_Sercop,
o.Per_Personal_Resp_Exp,
o.Fecha_Cierre_Rec_Ofertas,
o.Par_Razon_Social_Id_Contratista,
o.Valor_Contrato,
o.Plazo_Contrato,
o.Fecha_Inicio_Contrato,
o.Porcentaje_Anticipo_Contrato,
o.Per_Personal_Id_Admin,
o.Desc_Contrata,
o.Fecha_Crea,
o.Com_Procedimiento_Desc,
o.Estado_Portal,
o.Estado_Contratacion,
o.Fecha_Inicio_Elabora_Pliegos,
o.Fecha_Publicacion_Portal,
o.Fecha_Calificaciones,
o.Fecha_Estimada_Adjudicacion,
o.Fecha_Adjudicacion,
o.Fecha_Juridico,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByCodigo_Sercop
		public List<Com_Contrato> GetByCodigo_Sercop (Scope s , string p_Codigo_Sercop)
		{
			List<Com_Contrato> lista = new List<Com_Contrato>();
			var tabla = Adapter.GetByCodigo_Sercop( p_Codigo_Sercop);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato(
				fila.Id,
fila.Pla_Doc_Id,
fila.Estado,
fila.Com_Procedimiento_Id,
fila.Porcentaje_Anticipo_Ref,
fila.Plazo_Ref,
fila.Codigo_Sercop,
fila.Per_Personal_Resp_Exp,
fila.Fecha_Cierre_Rec_Ofertas,
fila.Par_Razon_Social_Id_Contratista,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Fecha_Inicio_Contrato,
fila.Porcentaje_Anticipo_Contrato,
fila.Per_Personal_Id_Admin,
fila.Desc_Contrata,
fila.Fecha_Crea,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Per_Personal_Nombre_Admin,
fila.Valor_Suma_Movs,
fila.Com_Procedimiento_Tipo,
fila.Com_Procedimiento_Nombre,
fila.Per_Personal_Nombre_Resp_Exp,
fila.Per_Personal_Id_Solicita,
fila.Per_Personal_Nombre_Solicita,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista,
fila.Pla_Doc_Cedula_Presup_Codigo,
fila.Pla_Doc_CPC_Codigo,
fila.Pla_Doc_PAC_Linea,
fila.Pla_Doc_Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Doc_Valor_Solicita,
fila.Com_Procedimiento_Desc,
fila.Estado_Portal,
fila.Estado_Contratacion,
fila.Fecha_Inicio_Elabora_Pliegos,
fila.Fecha_Publicacion_Portal,
fila.Fecha_Calificaciones,
fila.Fecha_Estimada_Adjudicacion,
fila.Fecha_Adjudicacion,
fila.Fecha_Juridico
				));
			}
			return lista;
		}
		// GetById
		public List<Com_Contrato> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Contrato> lista = new List<Com_Contrato>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato(
				fila.Id,
fila.Pla_Doc_Id,
fila.Estado,
fila.Com_Procedimiento_Id,
fila.Porcentaje_Anticipo_Ref,
fila.Plazo_Ref,
fila.Codigo_Sercop,
fila.Per_Personal_Resp_Exp,
fila.Fecha_Cierre_Rec_Ofertas,
fila.Par_Razon_Social_Id_Contratista,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Fecha_Inicio_Contrato,
fila.Porcentaje_Anticipo_Contrato,
fila.Per_Personal_Id_Admin,
fila.Desc_Contrata,
fila.Fecha_Crea,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Per_Personal_Nombre_Admin,
fila.Valor_Suma_Movs,
fila.Com_Procedimiento_Tipo,
fila.Com_Procedimiento_Nombre,
fila.Per_Personal_Nombre_Resp_Exp,
fila.Per_Personal_Id_Solicita,
fila.Per_Personal_Nombre_Solicita,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista,
fila.Pla_Doc_Cedula_Presup_Codigo,
fila.Pla_Doc_CPC_Codigo,
fila.Pla_Doc_PAC_Linea,
fila.Pla_Doc_Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Doc_Valor_Solicita,
fila.Com_Procedimiento_Desc,
fila.Estado_Portal,
fila.Estado_Contratacion,
fila.Fecha_Inicio_Elabora_Pliegos,
fila.Fecha_Publicacion_Portal,
fila.Fecha_Calificaciones,
fila.Fecha_Estimada_Adjudicacion,
fila.Fecha_Adjudicacion,
fila.Fecha_Juridico
				));
			}
			return lista;
		}
		// GetByLikePla_Tarea_Nombre
		public List<Com_Contrato> GetByLikePla_Tarea_Nombre (Scope s , string p_Pla_Tarea_Nombre)
		{
			List<Com_Contrato> lista = new List<Com_Contrato>();
			var tabla = Adapter.GetByLikePla_Tarea_Nombre( p_Pla_Tarea_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato(
				fila.Id,
fila.Pla_Doc_Id,
fila.Estado,
fila.Com_Procedimiento_Id,
fila.Porcentaje_Anticipo_Ref,
fila.Plazo_Ref,
fila.Codigo_Sercop,
fila.Per_Personal_Resp_Exp,
fila.Fecha_Cierre_Rec_Ofertas,
fila.Par_Razon_Social_Id_Contratista,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Fecha_Inicio_Contrato,
fila.Porcentaje_Anticipo_Contrato,
fila.Per_Personal_Id_Admin,
fila.Desc_Contrata,
fila.Fecha_Crea,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Per_Personal_Nombre_Admin,
fila.Valor_Suma_Movs,
fila.Com_Procedimiento_Tipo,
fila.Com_Procedimiento_Nombre,
fila.Per_Personal_Nombre_Resp_Exp,
fila.Per_Personal_Id_Solicita,
fila.Per_Personal_Nombre_Solicita,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista,
fila.Pla_Doc_Cedula_Presup_Codigo,
fila.Pla_Doc_CPC_Codigo,
fila.Pla_Doc_PAC_Linea,
fila.Pla_Doc_Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Doc_Valor_Solicita,
fila.Com_Procedimiento_Desc,
fila.Estado_Portal,
fila.Estado_Contratacion,
fila.Fecha_Inicio_Elabora_Pliegos,
fila.Fecha_Publicacion_Portal,
fila.Fecha_Calificaciones,
fila.Fecha_Estimada_Adjudicacion,
fila.Fecha_Adjudicacion,
fila.Fecha_Juridico
				));
			}
			return lista;
		}
		// GetByPla_Tarea_Codigo
		public List<Com_Contrato> GetByPla_Tarea_Codigo (Scope s , string p_Pla_Tarea_Codigo)
		{
			List<Com_Contrato> lista = new List<Com_Contrato>();
			var tabla = Adapter.GetByPla_Tarea_Codigo( p_Pla_Tarea_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato(
				fila.Id,
fila.Pla_Doc_Id,
fila.Estado,
fila.Com_Procedimiento_Id,
fila.Porcentaje_Anticipo_Ref,
fila.Plazo_Ref,
fila.Codigo_Sercop,
fila.Per_Personal_Resp_Exp,
fila.Fecha_Cierre_Rec_Ofertas,
fila.Par_Razon_Social_Id_Contratista,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Fecha_Inicio_Contrato,
fila.Porcentaje_Anticipo_Contrato,
fila.Per_Personal_Id_Admin,
fila.Desc_Contrata,
fila.Fecha_Crea,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Per_Personal_Nombre_Admin,
fila.Valor_Suma_Movs,
fila.Com_Procedimiento_Tipo,
fila.Com_Procedimiento_Nombre,
fila.Per_Personal_Nombre_Resp_Exp,
fila.Per_Personal_Id_Solicita,
fila.Per_Personal_Nombre_Solicita,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista,
fila.Pla_Doc_Cedula_Presup_Codigo,
fila.Pla_Doc_CPC_Codigo,
fila.Pla_Doc_PAC_Linea,
fila.Pla_Doc_Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Doc_Valor_Solicita,
fila.Com_Procedimiento_Desc,
fila.Estado_Portal,
fila.Estado_Contratacion,
fila.Fecha_Inicio_Elabora_Pliegos,
fila.Fecha_Publicacion_Portal,
fila.Fecha_Calificaciones,
fila.Fecha_Estimada_Adjudicacion,
fila.Fecha_Adjudicacion,
fila.Fecha_Juridico
				));
			}
			return lista;
		}
		// GetByRangoFecha_Crea
		public List<Com_Contrato> GetByRangoFecha_Crea (Scope s , DateTime p_Fecha_Crea_Ini, DateTime p_Fecha_Crea_Fin)
		{
			List<Com_Contrato> lista = new List<Com_Contrato>();
			var tabla = Adapter.GetByRangoFecha_Crea( p_Fecha_Crea_Ini, p_Fecha_Crea_Fin);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato(
				fila.Id,
fila.Pla_Doc_Id,
fila.Estado,
fila.Com_Procedimiento_Id,
fila.Porcentaje_Anticipo_Ref,
fila.Plazo_Ref,
fila.Codigo_Sercop,
fila.Per_Personal_Resp_Exp,
fila.Fecha_Cierre_Rec_Ofertas,
fila.Par_Razon_Social_Id_Contratista,
fila.Valor_Contrato,
fila.Plazo_Contrato,
fila.Fecha_Inicio_Contrato,
fila.Porcentaje_Anticipo_Contrato,
fila.Per_Personal_Id_Admin,
fila.Desc_Contrata,
fila.Fecha_Crea,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Per_Personal_Nombre_Admin,
fila.Valor_Suma_Movs,
fila.Com_Procedimiento_Tipo,
fila.Com_Procedimiento_Nombre,
fila.Per_Personal_Nombre_Resp_Exp,
fila.Per_Personal_Id_Solicita,
fila.Per_Personal_Nombre_Solicita,
fila.Par_Razon_Social_Nombre_Contratista,
fila.Par_Razon_Social_Numero_Contratista,
fila.Pla_Doc_Cedula_Presup_Codigo,
fila.Pla_Doc_CPC_Codigo,
fila.Pla_Doc_PAC_Linea,
fila.Pla_Doc_Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Doc_Valor_Solicita,
fila.Com_Procedimiento_Desc,
fila.Estado_Portal,
fila.Estado_Contratacion,
fila.Fecha_Inicio_Elabora_Pliegos,
fila.Fecha_Publicacion_Portal,
fila.Fecha_Calificaciones,
fila.Fecha_Estimada_Adjudicacion,
fila.Fecha_Adjudicacion,
fila.Fecha_Juridico
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_Contrato n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Pla_Doc_Id,
n.Estado,
n.Com_Procedimiento_Id,
n.Porcentaje_Anticipo_Ref,
n.Plazo_Ref,
n.Codigo_Sercop,
n.Per_Personal_Resp_Exp,
n.Fecha_Cierre_Rec_Ofertas,
n.Par_Razon_Social_Id_Contratista,
n.Valor_Contrato,
n.Plazo_Contrato,
n.Fecha_Inicio_Contrato,
n.Porcentaje_Anticipo_Contrato,
n.Per_Personal_Id_Admin,
n.Desc_Contrata,
n.Fecha_Crea,
n.Com_Procedimiento_Desc,
n.Estado_Portal,
n.Estado_Contratacion,
n.Fecha_Inicio_Elabora_Pliegos,
n.Fecha_Publicacion_Portal,
n.Fecha_Calificaciones,
n.Fecha_Estimada_Adjudicacion,
n.Fecha_Adjudicacion,
n.Fecha_Juridico
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
