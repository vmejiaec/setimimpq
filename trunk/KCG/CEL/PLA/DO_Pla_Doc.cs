using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.PlanificacionTableAdapters;
using AEL.PLA;
using BEL;
using System.Data.SqlClient;

namespace CEL.PLA
{
    public class DO_Pla_Doc
    {
	// adapter
    public Pla_DocTableAdapter Adapter = new Pla_DocTableAdapter();
	//Select
	public List<Pla_Doc> Get(Scope s)
    {
        List<Pla_Doc> lista = new List<Pla_Doc>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Doc n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Tipo,
n.Fecha_Solicita,
n.Per_Personal_Id_Solicita,
n.Area_Codigo_Solicita,
n.Descripcion,
n.Estado,
n.Per_Personal_Id_Crea,
n.Per_Personal_Id_Modifica,
n.Valor_Solicita,
n.Per_Personal_Id_Planifica,
n.Esta_Planificada,
n.Per_Personal_Id_Contrata,
n.Esta_Contratada,
n.PAC_Linea,
n.CPC_Codigo,
n.Fecha_Contrata,
n.Fecha_Planifica
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Doc o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Tipo,
o.Fecha_Solicita,
o.Per_Personal_Id_Solicita,
o.Area_Codigo_Solicita,
o.Descripcion,
o.Estado,
o.Per_Personal_Id_Crea,
o.Per_Personal_Id_Modifica,
o.Valor_Solicita,
o.Per_Personal_Id_Planifica,
o.Esta_Planificada,
o.Per_Personal_Id_Contrata,
o.Esta_Contratada,
o.PAC_Linea,
o.CPC_Codigo,
o.Fecha_Contrata,
o.Fecha_Planifica
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Doc o, Pla_Doc n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Tipo,
n.Fecha_Solicita,
n.Per_Personal_Id_Solicita,
n.Area_Codigo_Solicita,
n.Descripcion,
n.Estado,
n.Per_Personal_Id_Crea,
n.Per_Personal_Id_Modifica,
n.Valor_Solicita,
n.Per_Personal_Id_Planifica,
n.Esta_Planificada,
n.Per_Personal_Id_Contrata,
n.Esta_Contratada,
n.PAC_Linea,
n.CPC_Codigo,
n.Fecha_Contrata,
n.Fecha_Planifica,
o.Id,
o.Codigo,
o.Tipo,
o.Fecha_Solicita,
o.Per_Personal_Id_Solicita,
o.Area_Codigo_Solicita,
o.Descripcion,
o.Estado,
o.Per_Personal_Id_Crea,
o.Per_Personal_Id_Modifica,
o.Valor_Solicita,
o.Per_Personal_Id_Planifica,
o.Esta_Planificada,
o.Per_Personal_Id_Contrata,
o.Esta_Contratada,
o.PAC_Linea,
o.CPC_Codigo,
o.Fecha_Contrata,
o.Fecha_Planifica,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByArea_Codigo_RangoFecha_Solicita
		public List<Pla_Doc> GetByArea_Codigo_RangoFecha_Solicita (Scope s , string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByArea_Codigo_RangoFecha_Solicita( p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetByCodigo
		public List<Pla_Doc> GetByCodigo (Scope s , string p_Codigo)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByCodigo( p_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetById
		public List<Pla_Doc> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetByRangoFecha_Solicita
		public List<Pla_Doc> GetByRangoFecha_Solicita (Scope s , DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByRangoFecha_Solicita( p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetByTipo_Area_Codigo_Codigo
		public List<Pla_Doc> GetByTipo_Area_Codigo_Codigo (Scope s , string p_Tipo, string p_Area_Codigo, string p_Codigo)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByTipo_Area_Codigo_Codigo( p_Tipo, p_Area_Codigo, p_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetByTipo_Area_Codigo_LikeDescripcion
		public List<Pla_Doc> GetByTipo_Area_Codigo_LikeDescripcion (Scope s , string p_Tipo, string p_Area_Codigo, string p_Descripcion)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByTipo_Area_Codigo_LikeDescripcion( p_Tipo, p_Area_Codigo, p_Descripcion);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetByTipo_Area_Codigo_RangoFecha_Solicita
		public List<Pla_Doc> GetByTipo_Area_Codigo_RangoFecha_Solicita (Scope s , string p_Tipo, string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByTipo_Area_Codigo_RangoFecha_Solicita( p_Tipo, p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetByTipo_RangoFecha_Solicita
		public List<Pla_Doc> GetByTipo_RangoFecha_Solicita (Scope s , string p_Tipo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByTipo_RangoFecha_Solicita( p_Tipo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// GetByTipo_RangoFecha_Solicita_LikeDescripcion
		public List<Pla_Doc> GetByTipo_RangoFecha_Solicita_LikeDescripcion (Scope s , string p_Tipo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin, string p_Descripcion)
		{
			List<Pla_Doc> lista = new List<Pla_Doc>();
			var tabla = Adapter.GetByTipo_RangoFecha_Solicita_LikeDescripcion( p_Tipo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin, p_Descripcion);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha_Solicita,
fila.Per_Personal_Id_Solicita,
fila.Area_Codigo_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica,
fila.Valor_Solicita,
fila.Per_Personal_Id_Planifica,
fila.Esta_Planificada,
fila.Per_Personal_Id_Contrata,
fila.Esta_Contratada,
fila.PAC_Linea,
fila.CPC_Codigo,
fila.Fecha_Contrata,
fila.Fecha_Planifica,
fila.Per_Personal_Nombre_Solicita,
fila.Area_Nombre_Solicita,
fila.Per_Personal_Nombre_Crea,
fila.Per_Personal_Nombre_Modifica,
fila.Per_Personal_Nombre_Planifica,
fila.Per_Personal_Nombre_Contrata,
fila.Valor_Suma_Movs
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Doc n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Codigo,
n.Tipo,
n.Fecha_Solicita,
n.Per_Personal_Id_Solicita,
n.Area_Codigo_Solicita,
n.Descripcion,
n.Estado,
n.Per_Personal_Id_Crea,
n.Per_Personal_Id_Modifica,
n.Valor_Solicita,
n.Per_Personal_Id_Planifica,
n.Esta_Planificada,
n.Per_Personal_Id_Contrata,
n.Esta_Contratada,
n.PAC_Linea,
n.CPC_Codigo,
n.Fecha_Contrata,
n.Fecha_Planifica
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
