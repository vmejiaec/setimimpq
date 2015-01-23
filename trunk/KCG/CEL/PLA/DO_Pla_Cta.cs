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
    public class DO_Pla_Cta
    {
	// adapter
    public Pla_CtaTableAdapter Adapter = new Pla_CtaTableAdapter();
	//Select
	public List<Pla_Cta> Get(Scope s)
    {
        List<Pla_Cta> lista = new List<Pla_Cta>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Cta n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Anio,
n.Codigo,
n.Nivel,
n.Nombre,
n.Descripcion,
n.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Cta o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Anio,
o.Codigo,
o.Nivel,
o.Nombre,
o.Descripcion,
o.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Cta o, Pla_Cta n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Anio,
n.Codigo,
n.Nivel,
n.Nombre,
n.Descripcion,
n.Estado,
o.Id,
o.Anio,
o.Codigo,
o.Nivel,
o.Nombre,
o.Descripcion,
o.Estado,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByAnio
		public List<Pla_Cta> GetByAnio (Scope s , string p_Anio)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByAnio( p_Anio);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetByAnioArbolPla_Cta_Codigo
		public List<Pla_Cta> GetByAnioArbolPla_Cta_Codigo (Scope s , string p_Anio, string p_Pla_Cta_Codigo)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByAnioArbolPla_Cta_Codigo( p_Anio, p_Pla_Cta_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetByAnioArbolPla_Cta_Id
		public List<Pla_Cta> GetByAnioArbolPla_Cta_Id (Scope s , Int32 p_Pla_Cta_Id)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByAnioArbolPla_Cta_Id( p_Pla_Cta_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetByAnioArbolPla_Tarea_Id
		public List<Pla_Cta> GetByAnioArbolPla_Tarea_Id (Scope s , Int32 p_Pla_Tarea_Id)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByAnioArbolPla_Tarea_Id( p_Pla_Tarea_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetByAnioLikeCodigo
		public List<Pla_Cta> GetByAnioLikeCodigo (Scope s , string p_Anio, string p_Codigo)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByAnioLikeCodigo( p_Anio, p_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetByAnioLikeNombre
		public List<Pla_Cta> GetByAnioLikeNombre (Scope s , string p_Anio, string p_Nombre)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByAnioLikeNombre( p_Anio, p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetById
		public List<Pla_Cta> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetByLikeCodigo
		public List<Pla_Cta> GetByLikeCodigo (Scope s , string p_Codigo)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByLikeCodigo( p_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// GetByLikeNombre
		public List<Pla_Cta> GetByLikeNombre (Scope s , string p_Nombre)
		{
			List<Pla_Cta> lista = new List<Pla_Cta>();
			var tabla = Adapter.GetByLikeNombre( p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Cta(
				fila.Id,
fila.Anio,
fila.Codigo,
fila.Nivel,
fila.Nombre,
fila.Descripcion,
fila.Estado
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Cta n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Anio,
n.Codigo,
n.Nivel,
n.Nombre,
n.Descripcion,
n.Estado
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
		// Max_FechaDTM
			public DateTime? Max_FechaDTM (Scope s , string p_Area_Solicita)
		{
            DateTime? res;
            try
            {
				res = (DateTime?)Adapter.Max_FechaDTM( p_Area_Solicita);
            }
            catch (SqlException e)
            { throw (new Exception(e.Message)); }
            return res;
		}
		// SelNoRegistrosINT
			public int SelNoRegistrosINT (Scope s , string p_Anio)
		{
            int res;
            try
            {
				res = (int)Adapter.SelNoRegistrosINT( p_Anio);
            }
            catch (SqlException e)
            { throw (new Exception(e.Message)); }
            return res;
		}
		// SelTareasSTR
			public string SelTareasSTR (Scope s , string p_Anio, Int32 p_Pla_Cta_Id, DateTime p_Fecha)
		{
            string res;
            try
            {
				res = (string)Adapter.SelTareasSTR( p_Anio, p_Pla_Cta_Id, p_Fecha);
            }
            catch (SqlException e)
            { throw (new Exception(e.Message)); }
            return res;
		}
	}
}
