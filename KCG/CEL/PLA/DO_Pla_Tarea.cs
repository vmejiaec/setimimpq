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
    public class DO_Pla_Tarea
    {
	// adapter
    public Pla_TareaTableAdapter Adapter = new Pla_TareaTableAdapter();
	//Select
	public List<Pla_Tarea> Get(Scope s)
    {
        List<Pla_Tarea> lista = new List<Pla_Tarea>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado,
fila.Valor_Inicial,
fila.Valor_Suma
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Tarea n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Pla_Cta_Id,
n.Nombre,
n.Fecha_Ini,
n.Fecha_Fin,
n.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Tarea o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Pla_Cta_Id,
o.Nombre,
o.Fecha_Ini,
o.Fecha_Fin,
o.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Tarea o, Pla_Tarea n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Pla_Cta_Id,
n.Nombre,
n.Fecha_Ini,
n.Fecha_Fin,
n.Estado,
o.Id,
o.Codigo,
o.Pla_Cta_Id,
o.Nombre,
o.Fecha_Ini,
o.Fecha_Fin,
o.Estado,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByAnio
		public List<Pla_Tarea> GetByAnio (Scope s , string p_Anio)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetByAnio( p_Anio);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado,
fila.Valor_Inicial,
fila.Valor_Suma
				));
			}
			return lista;
		}
		// GetByAnioLikeNombre
		public List<Pla_Tarea> GetByAnioLikeNombre (Scope s , string p_Anio, string p_Nombre)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetByAnioLikeNombre( p_Anio, p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado,
fila.Valor_Inicial,
fila.Valor_Suma
				));
			}
			return lista;
		}
		// GetByAnioLikePla_Cta_Codigo
		public List<Pla_Tarea> GetByAnioLikePla_Cta_Codigo (Scope s , string p_Anio, string p_Pla_Cta_Codigo)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetByAnioLikePla_Cta_Codigo( p_Anio, p_Pla_Cta_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado,
fila.Valor_Inicial,
fila.Valor_Suma
				));
			}
			return lista;
		}
		// GetById
		public List<Pla_Tarea> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado,
fila.Valor_Inicial,
fila.Valor_Suma
				));
			}
			return lista;
		}
		// GetByPla_Cta_Id
		public List<Pla_Tarea> GetByPla_Cta_Id (Scope s , Int32 p_Pla_Cta_Id)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetByPla_Cta_Id( p_Pla_Cta_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado,
fila.Valor_Inicial,
fila.Valor_Suma
				));
			}
			return lista;
		}
		// GetByPla_Cta_IdLikeNombre
		public List<Pla_Tarea> GetByPla_Cta_IdLikeNombre (Scope s , Int32 p_Pla_Cta_Id, string p_Nombre)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetByPla_Cta_IdLikeNombre( p_Pla_Cta_Id, p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado,
fila.Valor_Inicial,
fila.Valor_Suma
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Tarea n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Codigo,
n.Pla_Cta_Id,
n.Nombre,
n.Fecha_Ini,
n.Fecha_Fin,
n.Estado
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
